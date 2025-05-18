import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

/// 커스텀 인풋
/// - [hintText] : 입력 필트에서 표시되는 힌트 텍스트 (= placeholder)
/// - [controller] : TextEditingController를 통해 외부에서 입력값을 제어하거나 읽을 수 있음
/// - [keyboardType] : 키보드 타입 (예: text, number, email 등)
class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  // 생성자 
  const AppTextField({
    super.key, // 상위 클래스에 전달
    required this.hintText, // 필수
    required this.controller, // 필수
    this.keyboardType = TextInputType.text, // 기본값: text
  });

  // ui 그리는 메서드 (부모 클래스의 매서드를 재정의)
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      // 입력 후 글씨
      style: const TextStyle (
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
        fillColor: AppColors.gray0,

        // 여백
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingM,
            vertical: AppSizes.paddingS
        ),

        // 테두리색 (기본)
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray100),
          borderRadius: BorderRadius.circular(8),
        ),

        // 테두리색 (포커스 상태)
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray500),
          borderRadius: BorderRadius.circular(8),
        )
      ),
    );
  }
}