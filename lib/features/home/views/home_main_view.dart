import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/header/home_header.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'package:ipsi_frontend/features/chatbot/views/chat_screen.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_screen.dart';
import 'package:ipsi_frontend/features/home/views/action_button_card.dart';
import 'package:ipsi_frontend/features/home/views/home_tab_toggle.dart';
import 'package:ipsi_frontend/features/home/views/quote_card.dart';

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
            HomeHeader(logo: "입시도리", d_day: '179'),
            QuoteCard(
              quote: "능력이 아니라 ‘선택’이 당신을 만듭니다.",
              author: "조앤 K. 롤링",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonCard(
                  title: "챗봇과 대화하기",
                  imgPath: "assets/images/icon/glass_chat.png",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
                ActionButtonCard(
                  title: "커리큘럼 생성하기",
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

            HomeTabToggle(
              isTodoSelected: isTodoSelected,
              onToggle: (bool value) {
                setState(() {
                  isTodoSelected = value;
                });
              },
            ),

            const SizedBox(height: AppSizes.paddingXL),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(isTodoSelected
                      ? "assets/images/characters/morrie.png"
                      : "assets/images/characters/morrie.png",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(height: 16),
                  Text(isTodoSelected
                      ? "생성된 투두가 없어요"
                      : "생성된 커리큘럼이 없어요", style: appTextTheme.bodyMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
