import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/bottombar/onboarding_bottombar.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/features/home/screens/home_screen.dart';
import 'package:ipsi_frontend/features/signup/screens/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // 코드로도 스와이프 되도록 하는 컨트롤러
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> messages = [
    "설문 분석으로 나에게 꼭 맞는 강의를 추천해줘요",
    "교재 추천부터 상담까지 실시간으로 도와드려요",
    "선택한 강의로 맞춤 커리큘럼을 관리해보세요",
    "추천 강의부터 최신 뉴스까지 확인해보세요",
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Image.asset('assets/images/characters/dori.png', height: 200),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: messages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (_, index) => _buildPage(messages[index]),
            ),
          ),

          // 온보딩 바텀바
          OnboardingBottomBar(
              isLastPage: _currentIndex == messages.length - 1,
              currentIndex: _currentIndex, // _ : private 변수명일 때 사용
              totalPageCount: messages.length,
              onSkip: () {
                _pageController.animateToPage(
                    messages.length - 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut
                );
              },
              onNext: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut
                );
              },
              onkakako: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen())
                );
              }
          )
        ],
      ),
    );
  }
}
