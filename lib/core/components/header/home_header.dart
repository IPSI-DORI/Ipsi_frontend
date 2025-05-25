import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/text_theme.dart';

class HomeHeader extends StatelessWidget {
  final String logo;

  const HomeHeader({
    super.key,
    required this.logo,
  });

  String getDday(){
    final current = DateTime.now();
    final Deadline = DateTime(2025, 11, 13);
    final difference = Deadline.difference(current).inDays;

    if (difference < 0) {
      final current = DateTime.now();
      final Deadline = DateTime(2026, 11, 19);
      final difference = Deadline.difference(current).inDays;
    }

    return difference.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 로고 + D-day
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 좌측: 로고 + D-day
                Row(
                  children: [
                    Text(logo, style: HomeLogo),
                    const SizedBox(width: 10),
                    Text('D-', style: appTextTheme.bodyLarge),
                    Text(getDday(), style: appTextTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
