import 'package:flutter/material.dart';
import '../constants/app_colors.dart';


// Social Button Widget
Widget socialButton(String assetPath) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: AppColors.background,
      shape: BoxShape.circle,
    ),
    child: Image.asset(assetPath, height: 24), 
  );
}
