import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import '../../../core/ui/components/header/title_header.dart';

class CurriculumDefaultScreen extends StatelessWidget {
  const CurriculumDefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitleHeader(title: "커리큘럼"),
        Expanded(
            child: Center(
          child: Text("아직 생성된 커리큘럼이 없어요"),
        )),
      ]),
    );
  }
}
