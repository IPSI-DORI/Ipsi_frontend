import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/text_theme.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  const TitleHeader({
    super.key,
    required this.title,
  });

  // UI
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingXS,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: appTextTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
