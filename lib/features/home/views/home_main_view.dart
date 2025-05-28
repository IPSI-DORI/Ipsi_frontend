import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/home_header.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'package:ipsi_frontend/features/chatbot/views/chat_screen.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_screen.dart';
import 'package:ipsi_frontend/features/home/views/action_button_card.dart';
import 'package:ipsi_frontend/features/home/views/home_tab_toggle.dart';
import 'package:ipsi_frontend/features/home/views/stats_card.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({super.key});

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  bool isTodoSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            HomeHeader(logo: "입시도리"),

            // 통계 카드
            StatsCard(
              subtitle: "오늘도 같이 성장해볼까요?",
              currentLevel: "입문자 ",
              totalLevel: "/ 초보자",
              imgPath: 'assets/images/characters/morrie/level1_morrie.png',
            ),

            // 챗봇, 커리큘럼 카드 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonCard(
                  title: "실시간\nAI 입시 상담",
                  imgPath: "assets/images/icon/glass_chat.png",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
                ActionButtonCard(
                  title: "맞춤형\n커리큘럼 생성",
                  imgPath: "assets/images/icon/glass_calendar.png",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurriculumScreen()),
                    );
                  },
                ),
              ],
            ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 100),
                  Text("아직 생성된 커리큘럼이 없어요", style: appTextTheme.bodyMedium)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
