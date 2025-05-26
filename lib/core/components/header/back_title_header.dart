import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/text_theme.dart';

class BackTitleHeader extends StatelessWidget {
  final String title;

  const BackTitleHeader({
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/icon/back.png',
              width: 24,
              height: 24,
            ),
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
