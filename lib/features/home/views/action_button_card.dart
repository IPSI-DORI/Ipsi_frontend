import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/text_theme.dart';

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

  // UI
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 12,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(AppSizes.paddingL),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: AppColors.primary3,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: appTextTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      imgPath,
                      width: AppSizes.iconXL,
                      height: AppSizes.iconXL,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
