// 커스텀 버튼

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

enum AppButtonSize { large, medium, small }

enum AppButtonStyle { filled, outlined }

class AppButton extends StatelessWidget {
  // 속성 정의
  final AppButtonSize size; // 버튼 사이즈를 선택했는지
  final AppButtonStyle style; // 버튼 스타일을 선택했는지
  final String text; // 버튼 텍스트를 입력했는지
  final VoidCallback? onPressed; // 버튼 클릭했는지 (선택)
  final bool enabled; // 참/거짓 형태의 사용 가능한지

  // 생성자 정의
  const AppButton(
      {super.key,
      required this.size,
      this.style = AppButtonStyle.filled,
      required this.text,
      this.onPressed,
      this.enabled = true // 기본: ture
      });

  // 사이즈별로 높이 반환하는 getter
  double get _buttonHeight {
    switch (size) {
      case AppButtonSize.large:
        return 58;
      case AppButtonSize.medium:
        return 48;
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
        return 350;
      case AppButtonSize.small:
        return 318;
    }
  }

  // ui
  @override
  Widget build(BuildContext context) {
    final isFilled = style == AppButtonStyle.filled;

    return SizedBox(
      width: _buttonWidth, // 너비: 꽉 채우기
      height: _buttonHeight, // 높이: 사이즈에 따라 조절
      child: ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: 0, // 그림자 삭제
            backgroundColor: isFilled
                ? (enabled ? AppColors.primary : AppColors.gray0)
                : AppColors.white,
            foregroundColor: isFilled
                ? (enabled ? AppColors.white : AppColors.gray300)
                : AppColors.gray800,
            side: isFilled
                ? null
                : BorderSide(color: AppColors.gray300, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
          ),
          child: Text(text)),
    );
  }
}
