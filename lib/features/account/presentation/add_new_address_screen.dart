import 'package:flutter/material.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/core/shared_models/user_addresses/data/model/create_address.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_cubit.dart';
import 'package:waie/core/shared_models/user_addresses/logic/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/features/account/presentation/saved_address_screen.dart';
import 'package:waie/features/account/presentation/widgets/app_bar_screen.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController countryController =
      TextEditingController(text: 'Saudi Arabia');
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    streetAddressController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarScreen(title: "New Address"),
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Address added successfully')),
            );
            // Navigator.pop(context);
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(height: 40),
                    UserInfoTextFormField(
                      controller: countryController,
                      labelText: "Country",
                      enabled: false,
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: stateController,
                      labelText: "State/Province/Region",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter state/province/region';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: cityController,
                      labelText: "City",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter city';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: streetAddressController,
                      labelText: "Street Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter street address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    UserInfoTextFormField(
                      controller: zipCodeController,
                      labelText: "Zip code (Postal Code)",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter zip code';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 100),
                    Center(
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Create a new address
                            final newAddress = CreateAddress(
                              streetAddress: streetAddressController.text,
                              city: cityController.text,
                              state: stateController.text,
                              zipCode: zipCodeController.text,
                              country: countryController.text,
                            );
                            addressCubit.createAddress(newAddress);
                            Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                const SavedAddressScreen(),
                              ),
                            );
                          }
                        },
                        color: Color.fromRGBO(118, 192, 67, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                        child: Text(
                          'Confirm details',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'cabin',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
