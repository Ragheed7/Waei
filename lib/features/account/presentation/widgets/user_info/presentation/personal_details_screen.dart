import 'package:flutter/material.dart';
import 'package:waie/core/shared_models/user_data/user_data.dart';
import 'package:waie/features/account/presentation/account_screen.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final UserData? userInfo;

  const PersonalDetailsScreen({super.key, this.userInfo});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {

    // Global key to identify the form
  final _formKey = GlobalKey<FormState>();

  // Controllers for email and username fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  // Email validator
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    // Simple email regex
    RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Username validator
  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (value.length < 4) {
      return 'Username must be at least 4 characters long';
    }
    if (value.length > 10) {
      return 'Username must be at most 10 characters long';
    }
    return null;
  }

  // Function to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, proceed with further actions
      final email = _emailController.text;
      final username = _usernameController.text;

      // For demonstration, we'll show a dialog with the input values
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Submitted'),
          content: Text('Email: $email\nUsername: $username'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _emailController.dispose();
    _usernameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Personal Details"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: Column(
                children: [
                // Divider(),
                SizedBox(height: 40),
                // SizedBox(height: 20),
                UserInfoTextFormField(controller: _usernameController, labelText: 'UserName', validator: _usernameValidator,),
                SizedBox(height: 20),
                UserInfoTextFormField(controller: _emailController, labelText: 'Email Address', validator: _emailValidator,),
                SizedBox(height: 100),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountScreen(),
                        ),
                      );
                    },
                    color: Color.fromRGBO(118, 192, 67, 1),
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                    child: Text(
                      'Saved changes',
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
