import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle subheadline = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );
  
  static const TextStyle bodyText = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 16.0,
  );
  
  static const TextStyle buttonText = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle inputText = TextStyle(
    color: AppColors.inputTextColor,
    fontSize: 16.0,
  );
  
  static const TextStyle placeholderText = TextStyle(
    color: AppColors.placeholderColor,
    fontSize: 16.0,
  );
}