import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    // Insert spaces after every 4 digits
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i % 4 == 0 && i != 0) {
        formatted += ' ';
      }
      formatted += digitsOnly[i];
    }

    // Adjust the cursor position
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
