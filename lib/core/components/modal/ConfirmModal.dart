import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../button/app_button.dart';

class ConfirmModal extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmModal({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.paddingXL,
          horizontal: AppSizes.paddingL,
        ),
        child: Column(
          children: [
            // 상단 바
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.gray200,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // 제목
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppSizes.paddingXS),

            // 설명
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.gray500,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.paddingXL),

            // 버튼 2개
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "취소",
                    onPressed: onCancel,
                    style: AppButtonStyle.outlined,
                    size: AppButtonSize.medium,
                  ),
                ),
                const SizedBox(width: AppSizes.paddingS),
                Expanded(
                  child: AppButton(
                    text: "확인",
                    onPressed: onConfirm,
                    style: AppButtonStyle.filled,
                    size: AppButtonSize.medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
