import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_request.dart';
import 'package:waie/features/account/presentation/widgets/user_info/data/model/update_user_response.dart';
import 'package:waie/features/account/presentation/widgets/user_info/logic/update_user_cubit.dart';
import 'package:waie/features/account/presentation/widgets/user_info/logic/update_user_state.dart';
import 'package:waie/features/account/presentation/widgets/user_info/presentation/widgets/user_info_text_form_field.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';

class UpdateUserForm extends StatefulWidget {
  const UpdateUserForm({Key? key}) : super(key: key);

  @override
  _UpdateUserFormState createState() => _UpdateUserFormState();
}

class _UpdateUserFormState extends State<UpdateUserForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userCubit = context.read<UserCubit>();
    final currentUser = userCubit.state;

    if (currentUser != null) {
      _userNameController.text = currentUser.userName ?? 'User name';
      _emailController.text = currentUser.email ?? 'email@example.com';
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

void _submitUpdate() {
  if (_formKey.currentState?.validate() ?? false) {
    final userCubit = context.read<UserCubit>();
    final currentUser = userCubit.state;

    // Use existing values if fields are empty
    final userName = _userNameController.text.trim().isEmpty
        ? currentUser?.userName ?? ''
        : _userNameController.text.trim();

    final email = _emailController.text.trim().isEmpty
        ? currentUser?.email ?? 'email@example.com'
        : _emailController.text.trim();

    final updateUserRequest = UpdateUserRequest(
      userName: userName,
      email: email,
    );

    context.read<UpdateUserCubit>().updateUser(updateUserRequest);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Update User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UpdateUserCubit,
            UpdateUserState<UpdateUserResponse>>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              success: (data) async {
                final userCubit = context.read<UserCubit>();
                userCubit.updateUserData(
                  userName: _userNameController.text.trim(),
                  email: _emailController.text.trim(),
                );
    
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User updated successfully!')),
                );
                Navigator.pop(context);
              },
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
              },
            );
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  // Username Field
                  UserInfoTextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 4) {
                        return 'Username must be at least 4 characters long';
                      }
                      // No error if empty
                      return null;
                    },
                    labelText: 'Username',
                  ),
                  const SizedBox(height: 16),
    
                  // Email Field
                  UserInfoTextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                      }
                      // No error if empty
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email Address',
                  ),
                  const SizedBox(height: 24),
    
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state is Loading ? null : _submitUpdate,
                      child: state is Loading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text('Update', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainGreen,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
