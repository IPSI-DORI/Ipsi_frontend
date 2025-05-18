import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

import '../../../core/constants/app_sizes.dart';

class ActionButtonCard extends StatelessWidget {
  final String title;
  final String imgPath;
  final VoidCallback onPressed;

  const ActionButtonCard({
    super.key,
    required this.title,
    required this.imgPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 10,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            margin: const EdgeInsets.symmetric(horizontal: AppSizes.padding2XS),
            decoration: BoxDecoration(
              color: AppColors.gray0,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
                SizedBox(width: AppSizes.paddingXL),
                Image.asset(
                  imgPath,
                  width: AppSizes.iconL,
                  height: AppSizes.iconL,
                ),
              ],
            ),
          ),
        ));
  }
}
