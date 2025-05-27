import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/title_header.dart';
import 'package:ipsi_frontend/core/components/text/text_icon_field.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'package:ipsi_frontend/features/mypage/views/profile_screen.dart';

import '../../../core/components/button/app_button.dart';
import 'grade_screen.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  String? _selectedExamTitle;
  String? _selectedExamYear;

  final TextEditingController _examYearController = TextEditingController();

  // 시험 제목 선택
  void _onExamTitleChanged(String? value) {
    setState(() {
      _selectedExamTitle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 헤더
          TitleHeader(title: "마이페이지"),

          // 유저 정보
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                            onExamTitleChanged: _onExamTitleChanged,
                            examYearController: _examYearController,
                          )),
                );
              },
              child: Row(
                children: [
                  // 캐릭터 프로필 이미지
                  Image.asset(
                    'assets/images/characters/morrie/morrie.png',
                    height: 64,
                  ),

                  // 여백
                  const SizedBox(width: AppSizes.paddingXS),

                  // 닉네임 텍스트
                  Text("닉네임", style: appTextTheme.bodyLarge),

                  // 여백 자동 확보
                  const Spacer(),

                  // > 아이콘
                  Image.asset(
                    'assets/images/icon/gray300_next.png',
                    height: 24,
                  ),
                ],
              ),
            ),
          ),

          // 성적 관리 버튼
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
            child: AppButton(
                text: "성적 관리",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GradeScreen()),
                  );
                },
                size: AppButtonSize.medium),
          ),

          // 설정 관련 필드
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("설정",
                        style: appTextTheme.bodyMedium
                            ?.copyWith(color: AppColors.gray300)),
                    TextIconField(title: "알림 설정"),
                    const SizedBox(height: AppSizes.paddingL),
                    Text("고객지원",
                        style: appTextTheme.bodyMedium
                            ?.copyWith(color: AppColors.gray300)),
                    Column(children: [
                      TextIconField(title: "공지사항"),
                      TextIconField(title: "의견 남기기"),
                      TextIconField(title: "앱 관리")
                    ]),
                    const SizedBox(height: AppSizes.paddingL),
                    Text("기타",
                        style: appTextTheme.bodyMedium
                            ?.copyWith(color: AppColors.gray300)),
                    TextIconField(title: "로그아웃"),
                    TextIconField(title: "탈퇴하기")
                  ]))
        ]));
  }
}
