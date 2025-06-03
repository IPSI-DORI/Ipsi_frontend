import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../theme/text_theme.dart';

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // < 이미지
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // 이전 화면으로 이동
                },
                child: Image.asset(
                  'assets/images/icon/back.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: appTextTheme.titleLarge,
              ),
            )
            // 제목
          ],
        ),
      ),
    );
  }
}
