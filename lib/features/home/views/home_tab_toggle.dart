import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

class HomeTabToggle extends StatelessWidget {
  final bool isTodoSelected;
  final void Function(bool) onToggle;

  const HomeTabToggle({
    super.key,
    required this.isTodoSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.gray0,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Row(
        children: [
          // 투두 리스트
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              onTap: () => onToggle(true),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: AppSizes.paddingXS),
                decoration: BoxDecoration(
                  color: isTodoSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Center(
                  child: Text('투두 리스트',
                      style: isTodoSelected
                          ? appTextTheme.bodyLarge
                          : appTextTheme.bodyLarge
                              ?.copyWith(color: AppColors.gray300)),
                ),
              ),
            ),
          ),

          // 커리큘럼
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => onToggle(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isTodoSelected ? Colors.transparent : Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Center(
                  child: Text('커리큘럼',
                      style: isTodoSelected
                          ? appTextTheme.bodyLarge
                              ?.copyWith(color: AppColors.gray300)
                          : appTextTheme.bodyLarge),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
