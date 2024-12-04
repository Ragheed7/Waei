import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      title: Text("Error"),
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'cabin',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "OK",
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'cabin',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
