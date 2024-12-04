import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';
import 'package:waie/features/home/data/model/services/create_service_request.dart';
import 'package:waie/features/home/logic/cubit/create_service_cubit.dart';
import 'package:waie/features/home/logic/cubit/create_service_state.dart';
import 'package:waie/features/home/presentation/widgets/order_success_screen.dart';
import 'package:image/image.dart' as img;

class RepairScreen extends StatefulWidget {
  @override
  _RepairScreenState createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController descriptionController = TextEditingController();

  List<File> selectedImages = [];

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> pickImages() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        setState(() {
          selectedImages = pickedFiles.map((e) => File(e.path)).toList();
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<String> compressAndEncodeImage(File file) async {
    try {
      final bytes = await file.readAsBytes();
      img.Image? image = img.decodeImage(bytes);
      if (image == null) return '';

      img.Image resized = img.copyResize(image, width: 800);
      Uint8List compressed = Uint8List.fromList(img.encodeJpg(resized, quality: 70));
      return base64Encode(compressed);
    } catch (e) {
      print('Error compressing image: $e');
      return '';
    }
  }

  void submitRequest(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (selectedImages.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please upload at least one image')),
        );
        return;
      }

      List<String> imagesString64 = [];
      for (var imageFile in selectedImages) {
        String base64Image = await compressAndEncodeImage(imageFile);
        if (base64Image.isNotEmpty) {
          imagesString64.add(base64Image);
        }
      }

      CreateServiceRequest request = CreateServiceRequest(
        requestType: RequestType.Repair,
        productDetails: descriptionController.text,
        requestedPrice: 0,
        purchasePrice: 0,
        imagesString64: imagesString64,
      );

      context.read<CreateServiceCubit>().submitCreateService(request);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateServiceCubit, CreateServiceState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent closing while loading
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          success: (data) {
            Navigator.of(context).pop(); // Close the loading dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderSuccessScreen(),
              ),
            );
          },
          failure: (error) {
            Navigator.of(context).pop(); // Close the loading dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  error,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'cabin',
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the error dialog
                    },
                    child: const Text(
                      "Got it",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'cabin',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Repair"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    SizedBox(height: 10),
                    // Image upload section
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 18),
                          Expanded(
                            child: ListView.builder(
                              itemCount: selectedImages.length + 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == selectedImages.length) {
                                  return GestureDetector(
                                    onTap: pickImages,
                                    child: Container(
                                      // height: 50,
                                      width: 100,
                                      margin: EdgeInsets.only(right: 10, bottom: 18),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.add_a_photo,
                                        size: 50,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: 100,
                                        margin: EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.file(
                                            selectedImages[index],
                                            fit: BoxFit.cover,
                                            height: 114,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 15,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedImages.removeAt(index);
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.red,
                                            child: Icon(
                                              Icons.close,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    UserInfoTextFormField(
                      controller: descriptionController,
                      labelText: "Description",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      maxLines: 5,
                    ),
                    SizedBox(height: 100),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          submitRequest(context);
                        },
                        color: Color.fromRGBO(118, 192, 67, 1),
                        padding: EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                        child: Text(
                          'Submit Request',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cabin',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
