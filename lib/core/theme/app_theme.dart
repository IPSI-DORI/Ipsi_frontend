import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'text_theme.dart';

// 전체 테마 통합 적용 (MaterialApp에서 적용)
class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    fontFamily: 'Pretendard',
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      surface: Colors.white,
    ),
    textTheme: appTextTheme,
  );
}
