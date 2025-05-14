import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

import '../../../core/widgets/loading_spinner.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '입시도리',
              style: TextStyle(color: AppColors.primary, fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),
            const QuadCircleSpinner(), // 여기에 로딩 스피너 삽입!
          ],
        ),
      ),
    );
  }
}