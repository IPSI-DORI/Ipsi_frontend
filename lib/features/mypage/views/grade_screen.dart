import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/features/mypage/views/grage_add_screen.dart';

import '../../../core/theme/text_theme.dart';
import 'grade_detail_screen.dart';

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

          // 필터 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterClip("전체", true),
                _buildFilterClip("3월", false),
                _buildFilterClip("6월", false),
                _buildFilterClip("9월", false),
                _buildFilterClip("11월", false),
              ],
            ),
          ),

          // 카드 리스트
          Expanded(
            child: ListView(
              children: [
                _buildGradeCard(context, "2024년 11월 평가원 모의고사"),
                _buildGradeCard(context, "2024년 9월 평가원 모의고사"),
                _buildGradeCard(context, "2024년 6월 평가원 모의고사"),
                _buildGradeCard(context, "2024년 3월 평가원 모의고사"),
              ],
            ),
          ),
          // 추가하기 버튼
          AppButton(
            size: AppButtonSize.large,
            text: "추가하기",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GrageAddScreen()),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildFilterClip(String label, bool selected) {
    return ChoiceChip(label: Text(label), selected: selected);
  }

  Widget _buildGradeCard(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.gray0, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 취소 아이콘
          Row(
            children: [
              Text(title, style: TextTheme().titleLarge),
              Spacer(),
              Image.asset(
                "assets/images/icon/cancel.png",
                height: 24,
                width: 24,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "국어",
                style:
                    appTextTheme.bodySmall?.copyWith(color: AppColors.gray500),
              ),
              Text(" | ",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text("수학",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text(" | ",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text("탐구",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
            ],
          ),
          AppButton(
              size: AppButtonSize.medium,
              style: AppButtonStyle.outlined,
              text: "상세보기",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GradeDetailScreen()),
                );
              })
        ],
      ),
    );
  }
}
