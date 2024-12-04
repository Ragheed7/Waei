import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/helpers/constants.dart';
import 'package:waie/core/theming/colors.dart';
import 'package:waie/features/login/logic/cubit/login_cubit.dart';

class PhoneNumberFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PhoneNumberFormWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone number',
            style: TextStyle(
              fontFamily: 'cabin',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: loginCubit.phoneController,
            keyboardType: TextInputType.phone,
            cursorColor: ColorsManager.mainGreen,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  ImageLoader.saudiFlag,
                  height: 22,
                ),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              hintText: 'Phone number',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              RegExp regex = RegExp(r'^0?5[0-9]{8}$');
              if (!regex.hasMatch(value)) {
                return 'Please enter a valid Saudi phone number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
