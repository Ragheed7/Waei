import 'package:flutter/material.dart';
import 'package:waie/core/helpers/spacing.dart';
import 'package:waie/features/login/presentation/widgets/bottom_text_widget.dart';
import 'package:waie/features/login/presentation/widgets/logo_image_widget.dart';
import 'package:waie/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:waie/features/login/presentation/widgets/phone_number_form_widget.dart';
import 'package:waie/features/login/presentation/widgets/signIn_button_widget.dart';
import 'package:waie/features/login/presentation/widgets/signIn_title_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bottomWidgetHeight = 100.0; 

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: bottomWidgetHeight),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    verticalSpace(80),
                    const LogoImageWidget(),
                    verticalSpace(48),
                    const SignInTitleWidget(),
                    verticalSpace(32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PhoneNumberFormWidget(formKey: formKey),
                          verticalSpace(64),
                          SignInButtonWidget(formKey: formKey),
                          verticalSpace(8),
                          verticalSpace(100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -70,
              child: const BottomTextButtonsWidget(),
            ),
            // Bloc Listener
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }
}
