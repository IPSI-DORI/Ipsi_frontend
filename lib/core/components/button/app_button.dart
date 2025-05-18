// 커스텀 버튼

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

enum AppButtonSize { large, medium, small }

class AppButton extends StatelessWidget {

  // 속성 정의
  final AppButtonSize size; // 버튼 사이즈를 선택했는지
  final String text; // 버튼 텍스트를 입력했는지
  final VoidCallback? onPressed; // 버튼 클릭했는지 (선택)
  final bool enabled; // 참/거짓 형태의 사용 가능한지

  // 생성자 정의
  const AppButton ({
    super.key,
    this.size = AppButtonSize.large,   // 기본: large
    required this.text,
    this.onPressed,
    this.enabled = true   // 기본: ture
  });

  // 사이즈별로 높이 반환하는 getter
  double get _buttonHeight {
    switch (size) {
      case AppButtonSize.large:
        return 58;
      case AppButtonSize.medium:
        return 44;
      case AppButtonSize.small:
        return 30;
    }
  }

  // 사이즈별로 너비 반환하는 getter
  double get _buttonWidth {
    switch (size) {
      case AppButtonSize.large:
        return 350;
      case AppButtonSize.medium:
        return 0.6;
      case AppButtonSize.small:
        return 0.3;
    }
  }

  // ui
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _buttonWidth,   // 너비: 꽉 채우기
      height: _buttonHeight,   // 높이: 사이즈에 따라 조절
      child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: enabled ? AppColors.primary : AppColors.gray0,
            foregroundColor: enabled ? AppColors.white : AppColors.gray300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
          ),
          child: Text(text)
      ),
    );
  }
}