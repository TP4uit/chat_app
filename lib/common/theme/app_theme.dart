import 'package:chat_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.primaryColor),
        bodyMedium: TextStyle(color: AppColors.primaryColor),
        bodySmall: TextStyle(color: AppColors.primaryColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }
}
