import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_done_Screen.dart';
import 'package:ipsi_frontend/features/onboarding/views/onboarding_screen.dart';
import '../../../core/widgets/loading_spinner.dart';


// 상태 변화를 관리하는 StatefuleWidget을 확장한 SplashScreen 화면 선언
class CurriculumCreatingScreen extends StatefulWidget {
  const CurriculumCreatingScreen({super.key});

  @override
  State<CurriculumCreatingScreen> createState() => _CurriculumCreatingScreenState();
}

class _CurriculumCreatingScreenState extends State<CurriculumCreatingScreen> {

  // 최초 한 번만 실행
  @override
  void initState() {
    super.initState();
    // 3초 후 온보딩 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CurriculumDone()),
      );
    });
  }

  // 빌드 될 때마다 실행
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const QuadCircleSpinner(), // 여기에 로딩 스피너 삽입!
            const SizedBox(height: 80),
            Text("커리큘럼을 생성중 ...", style: appTextTheme.bodyLarge)
          ],
        ),
      ),
    );
  }
}