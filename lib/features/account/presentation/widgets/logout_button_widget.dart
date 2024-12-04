import 'package:flutter/material.dart';
import 'package:waie/core/di/dependency_injection.dart';
import 'package:waie/core/routing/routes.dart';
import 'package:waie/features/auth/repo/auth_repo.dart';
import 'package:waie/features/login/logic/cubit/user_cubit.dart';

class LogoutButtonWidget extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;

  const LogoutButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
  }) : super(key: key);

  @override
  _LogoutButtonWidgetState createState() => _LogoutButtonWidgetState();
}

class _LogoutButtonWidgetState extends State<LogoutButtonWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : MaterialButton(
              onPressed: () async {
                bool? confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Confirm Logout'),
                    content: const Text('Are you sure you want to log out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel', style: TextStyle(color: Colors.black),),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Logout', style: TextStyle(color: Colors.red),),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    // Perform logout
                    await getIt<AuthRepository>().logout();

                    // Clear the UserCubit
                    final userCubit = getIt<UserCubit>();
                    userCubit.clearUser();

                    // Navigate to the login screen and clear the navigation stack
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      (route) => false,
                    );
                  } catch (e) {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logout failed: ${e.toString()}')),
                    );
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
              },
              color: widget.buttonColor,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 16),
              child: Text(
                widget.buttonText,
                style: const TextStyle(
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
    );
  }
}

