import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM, vertical: AppSizes.paddingXL),
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary3,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quote, style: appTextTheme.bodyLarge),
          const SizedBox(height: 5),
          Text(
            author,
            style: appTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
