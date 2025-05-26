import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/features/mypage/views/grage_add_screen.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildGradeCard("2024년 11월 평가원 모의고사"),
                _buildGradeCard("2024년 9월 평가원 모의고사"),
                _buildGradeCard("2024년 6월 평가원 모의고사"),
                _buildGradeCard("2024년 3월 평가원 모의고사"),
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

  Widget _buildGradeCard(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.gray0, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextTheme().titleLarge),
          Spacer(),
          Image.asset(
            "assets/images/icon/cancel.png",
            height: 24,
            width: 24,
          )
        ],
      ),
    );
  }
}
