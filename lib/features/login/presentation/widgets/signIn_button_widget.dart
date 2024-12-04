import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';

class SignInButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignInButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Container(
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            loginCubit.emitLoginStates();
          }
        },
        color: ColorsManager.mainGreen,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        child: Text(
          'Sign-In',
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
    );
  }
}
