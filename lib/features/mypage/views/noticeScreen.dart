import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class Noticescreen extends StatefulWidget {
  const Noticescreen({super.key});

  @override
  State<Noticescreen> createState() => _NoticescreenState();
}

class _NoticescreenState extends State<Noticescreen> {
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
          BackTitleHeader(title: "공지사항")


        ]));
  }
}
