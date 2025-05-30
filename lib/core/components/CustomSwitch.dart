import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

import '../constants/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: AppSizes.iconXL,
        height: AppSizes.iconL,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius3XL),
          color: value ? AppColors.primary : AppColors.gray100,
        ),
        padding: const EdgeInsets.all(AppSizes.radiusS),
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: AppSizes.iconM,
          height: AppSizes.iconM,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
