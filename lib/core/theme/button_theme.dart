import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'text_theme.dart';

// 버튼 스타일 (ElevatedButton, TextButton 등)
final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    textStyle: appTextTheme.labelLarge,
    minimumSize: Size(double.infinity, 52),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final TextButtonThemeData textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    textStyle: appTextTheme.bodyMedium,
  ),
);
