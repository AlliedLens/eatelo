
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';




// Input Field Widget
Widget InputField(String hint, TextEditingController controller, {bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.background,
      hintText: hint,
      hintStyle: const TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: 18,
        color: Colors.black,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
