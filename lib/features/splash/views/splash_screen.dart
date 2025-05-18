import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/features/onboarding/views/onboarding_screen.dart';
import '../../../core/widgets/loading_spinner.dart';


// 상태 변화를 관리하는 StatefuleWidget을 확장한 SplashScreen 화면 선언
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // 최초 한 번만 실행
  @override
  void initState() {
    super.initState();
    // 3초 후 온보딩 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  // 빌드 될 때마다 실행
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