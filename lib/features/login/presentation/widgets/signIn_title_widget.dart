import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInTitleWidget extends StatelessWidget {
  const SignInTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      alignment: Alignment.topLeft,
      child: Text(
        'Register',
        style: TextStyle(
          fontFamily: 'cabin',
          fontSize: 32,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
