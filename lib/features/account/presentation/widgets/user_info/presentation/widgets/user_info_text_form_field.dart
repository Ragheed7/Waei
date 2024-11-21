import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';
class UserInfoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;
  final bool enabled;

  const UserInfoTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: ColorsManager.mainGreen,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              const BorderSide(width: 1, color: ColorsManager.mainGreen),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
      validator: validator,
      enabled: enabled,
    );
  }
}
