import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

/// 커스텀 인풋
class AppTextField extends StatelessWidget {
  // 속성 정의
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  // 생성자 정의
  const AppTextField({
    super.key, // 상위 클래스에 전달
    required this.title,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text, // 기본값: text
  });

  // ui
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 타이틀
            Text(
              title,
              style: appTextTheme.bodyLarge,
            ),
            const SizedBox(height: AppSizes.paddingXS), // 간격
            TextField(
              controller: controller,
              keyboardType: keyboardType,

              // 입력 후 글씨
              style: const TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: AppColors.gray800,
              ),

              // 입력 전 글씨
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: AppColors.gray300,
                  ),

                  // 인풋란 배경색
                  filled: true,
                  fillColor: AppColors.white,

                  // 여백
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingM,
                      vertical: AppSizes.paddingS),

                  // 테두리색 (기본)
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.gray100),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  // 테두리색 (포커스 상태)
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.gray500),
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  )),
            )
          ],
        ));
  }
}
