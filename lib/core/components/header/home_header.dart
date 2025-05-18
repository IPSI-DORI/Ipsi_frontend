import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../theme/text_theme.dart';

class HomeHeader extends StatelessWidget {
  final String logo;
  final String d_day;

  const HomeHeader({
    super.key,
    required this.logo,
    required this.d_day,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 로고 + D-day + 알림
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 좌측: 로고 + D-day
                Row(
                  children: [
                    Text(logo, style: primaryLogo),
                    const SizedBox(width: 10),
                    Text('D-', style: appTextTheme.bodyLarge),
                    Text(d_day, style: appTextTheme.bodyLarge),
                  ],
                ),

                /// 우측: 알림 아이콘
                Image.asset(
                  'assets/images/icon/alert.png',
                  width: AppSizes.iconM,
                  height: AppSizes.iconM,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
