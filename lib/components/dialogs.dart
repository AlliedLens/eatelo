import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

void showErrorDialog(BuildContext context, String message) {
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Error'),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('OK'),
      ),
    ],
  ),
);
}

