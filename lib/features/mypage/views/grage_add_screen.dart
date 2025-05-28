import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/components/text/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/text/app_text_field.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/mypage/views/grade_screen.dart';

class GrageAddScreen extends StatelessWidget {
  final Function(String?) onExamTitleChanged;
  final TextEditingController examYearController;

  const GrageAddScreen(
      {super.key,
      required this.onExamTitleChanged,
      required this.examYearController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // 스크롤 가능한 영역
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackTitleHeader(title: "성적 추가"),
        Expanded(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL,
                vertical: AppSizes.paddingS,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDropdown(
                      title: "시험 종류",
                      items: [
                        "2024년 11월 평가원 모의고사",
                        "2024년 9월 평가원 모의고사",
                        "2024년 6월 평가원 모의고사",
                        "2024년 3월 평가원 모의고사",
                      ],
                      hint: "시험 종류를 선택해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
                    ),
                    AppTextField(
                      title: "년도",
                      hintText: "년도를 입력해주세요",
                      controller: examYearController,
                    ),
                    AppDropdown(
                      title: "과목",
                      items: ["국어", "수학", "사회탐구", "과학탐구"],
                      hint: "과목을 선택해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
                    ),
                    AppTextField(
                      title: "원점수(득점)",
                      hintText: "성적표에 있는 원점수(득점)을 입력해주세요",
                      controller: examYearController,
                    ),
                    AppDropdown(
                      title: "등급",
                      items: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
                      hint: "성적표에 있는 등급을 선택해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
                    ),
                    AppTextField(
                      title: "백분위",
                      hintText: "성적표에 있는 백분위를 입력해주세요",
                      controller: examYearController,
                    ),
                  ]) // 버튼과 간격
              ),
        ),
      ]),

      // 버튼은 하단 고정
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppSizes.paddingL),
        child: AppButton(
          size: AppButtonSize.large,
          text: "등록하기",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GradeScreen()),
            );
          },
        ),
      ),
    );
  }
}
