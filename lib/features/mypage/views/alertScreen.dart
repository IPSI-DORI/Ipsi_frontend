import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class Alertscreen extends StatefulWidget {
  const Alertscreen({super.key});

  @override
  State<Alertscreen> createState() => _AlertscreenState();
}

class _AlertscreenState extends State<Alertscreen> {
  // 시험 제목 선택
  void _onExamTitleChanged(String? value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 헤더
          BackTitleHeader(title: "알림 설정")
        ]));
  }
}
