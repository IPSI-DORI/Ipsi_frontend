import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class GrageAddScreen extends StatelessWidget {
  const GrageAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            BackTitleHeader(title: "추가"),
          ],
        ));
  }
}
