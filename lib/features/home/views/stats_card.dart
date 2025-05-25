import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

class StatsCard extends StatelessWidget {
  final String subtitle;
  final String currentLevel;
  final String totalLevel;
  final String imgPath;

  const StatsCard({
    super.key,
    required this.subtitle,
    required this.currentLevel,
    required this.totalLevel,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 박스 패딩 및 마진
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM, vertical: AppSizes.paddingL),
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
      width: double.infinity,

      // 회색 박스 스타일
      decoration: BoxDecoration(
        color: AppColors.gray0,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),

      // 회색 박스 내용
      child: Column(
        children: [
          // 텍스트 + 캐릭터
          Row(
            children: [
              // 텍스트
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 질문
                      Text(subtitle, style: appTextTheme.labelLarge),

                      // 현재 레벨 / 전체 레벨
                      Row(children: [
                        Text(currentLevel, style: appTextTheme.titleLarge),
                        Text(totalLevel, style: appTextTheme.bodySmall),
                      ]),
                    ]),
              ),

              Image.asset(
                imgPath,
                width: AppSizes.icon2XL,
                height: AppSizes.icon2XL,
              ),
            ],
          ),

          // 흰색 박스
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 여백 균등 분배
                  children: [
                    // 진행률
                    Column(children: [
                      Text("진행률", style: appTextTheme.labelLarge),
                      Text("N%", style: appTextTheme.titleLarge),
                    ]),

                    // 세로 구분선
                    Container(
                      height: 28,
                      width: 3,
                      color: AppColors.gray0,
                      margin: const EdgeInsets.all(20),
                    ),

                    // 전체 투두
                    Column(children: [
                      Text("전체 투두", style: appTextTheme.labelLarge),
                      Text("N개", style: appTextTheme.titleLarge),
                    ]),

                    // 세로 구분선
                    Container(
                      height: 28,
                      width: 3,
                      color: AppColors.gray0,
                      margin: const EdgeInsets.all(20),
                    ),

                    // 남은 투두
                    Column(children: [
                      Text("남은 투두", style: appTextTheme.labelLarge),
                      Text("N개", style: appTextTheme.titleLarge),
                    ]),
                  ])),
        ],
      ),
    );
  }
}
