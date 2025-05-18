import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import '../constants/app_colors.dart';

// 커스텀 셀렉트박스
class AppDropdown<T> extends StatelessWidget {
  final List<T> items; // 드롭다운에 표시할 값들
  final T? value; // 현재 선택된 값
  final String hint; // 선택 전 힌트 문구
  final void Function(T?) onChanged;

  const AppDropdown({
    super.key,
    required this.items,
    this.value,
    required this.hint,
    required this.onChanged,
    required String hintText
  }); // 값 변경 콜백

  // ui
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item.toString())))
            .toList(),
        onChanged: onChanged,

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
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.gray300,
          ),

          // 배경색
          filled: true,
          fillColor: AppColors.white,

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