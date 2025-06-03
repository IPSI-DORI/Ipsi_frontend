import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/home/views/home_screen.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/ui/components/app_button.dart';

class SignupResultScreen extends StatelessWidget {
  final String nickname;
  final bool enabled;

  const SignupResultScreen(
      {super.key, required this.nickname, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Image.asset(
              'assets/images/characters/morrie/level1_morrie.png',
              height: 200,
            ),
            const SizedBox(height: 40),

            /// 닉네임 강조 문장
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: '$nickname', style: TextTheme().titleLarge),
                    const TextSpan(text: '님은 '),
                    TextSpan(text: '누누', style: primaryTitleLarge),
                    TextSpan(text: '와 어울려요!', style: TextTheme().titleLarge),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// 특징 설명
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  BulletText(text: '핵심을 빠르게 이해하고'),
                  BulletText(text: '‘What’보다 “Why”에 더 집중해요'),
                  BulletText(text: '요약본이나 플래시카드를 잘 활용해요'),
                ],
              ),
            ),

            const Spacer(),

            /// 하단 버튼
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: AppButton(
                      text: '시작하기',
                      size: AppButtonSize.large,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }),
                )),
          ],
        ),
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
