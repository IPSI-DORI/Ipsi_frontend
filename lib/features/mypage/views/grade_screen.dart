import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/components/header/title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

import '../../../core/components/button/app_button.dart';

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            BackTitleHeader(title: "성적 관리"),

            // 상자
            Container(

            )
          ],
        ));
  }
}
