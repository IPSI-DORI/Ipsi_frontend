import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

final TextTheme appTextTheme = TextTheme(
  // Title
  titleLarge: TextStyle( // ex. Title 1 Bold (20/170)
    fontFamily: 'Pretendard',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.7,
    color: AppColors.gray800,
  ),
  titleMedium: TextStyle( // ex. Title 2 Bold (16/150)
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: AppColors.gray800,
  ),

  // Body
  bodyLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
    color: AppColors.gray800,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.7,
    letterSpacing: -0.25,
    color: AppColors.gray800,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.gray800,
  ),

  // Button
  labelLarge: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.gray800,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: AppColors.gray800,
  ),

  // Caption, Footnote
  labelSmall: TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.gray800,
  ),
);
