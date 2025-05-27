import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/components/text/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/text/app_text_field.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/mypage/views/grade_screen.dart';
import 'package:ipsi_frontend/features/mypage/views/mypage_screen.dart';

class ProfileScreen extends StatelessWidget {
  final Function(String?) onExamTitleChanged;
  final TextEditingController examYearController;

  const ProfileScreen(
      {super.key,
      required this.onExamTitleChanged,
      required this.examYearController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // 스크롤 가능한 영역
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackTitleHeader(title: "프로필 편집"),
        Expanded(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL,
                vertical: AppSizes.paddingS,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      title: "닉네임",
                      hintText: "새로운 닉네임을 입력해주세요",
                      controller: examYearController,
                    ),
                    AppDropdown(
                      title: "학년",
                      items: ['고등학교 1학년', '고등학교 2학년', '고등학교 3학년', '반수', '재수'],
                      hint: "새로운 학년을 선택해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
                    ),
                    AppDropdown(
                      title: "희망 대학교",
                      items: ['서울대학교', '연세대학교', '고려대학교', '서강대', '성균관대', '한양대'],
                      hint: "새로운 목표 대학교를 선택해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
                    ),
                    AppDropdown(
                      title: "희망 전공",
                      items: [
                        '컴퓨터공학과',
                        '소프트웨어공학과',
                        '정보통신공학과',
                        '인공지능학과',
                      ],
                      hint: "새로운 목표 전공을 입력해주세요",
                      onChanged: onExamTitleChanged,
                      hintText: '',
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
          text: "수정하기",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPageScreen()),
            );
          },
        ),
      ),
    );
  }
}
