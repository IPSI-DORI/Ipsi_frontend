import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/signup/views/signup_screen.dart';
import '../../../core/constants/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> titles = [
    "투두리스트 체크 및 진행률 확인",
    "챗봇과의 질의응답",
    "맞춤형 강의 추천",
    "커리큘럼 생성 및 일정 관리",
  ];

  final List<String> messages = [
    "커리큘럼을 기반으로 매일 할일을 알려드려요",
    "궁금한 사항을 24시간 편하게 물어보세요",
    "공부 일정과 스타일, 현재 성적에 맞는\n강의를 추천받으세요",
    "원하는 강의로 커리큘럼을 만들고\n공부 현황을 확인해보세요",
  ];

  final List<String> imagePaths = [
    'assets/images/mockup/home_onboarding.png',
    'assets/images/mockup/chatbot_onboarding.png',
    'assets/images/mockup/curriculum_onboarding.png',
    'assets/images/mockup/todolist_onboarding.png',
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

  Widget _buildPage(String title, String message, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        Image.asset(imagePath, height: 420),
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: AppSizes.font20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: AppSizes.font16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    if (_currentIndex == messages.length - 1) {
      return Padding(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.gray800,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              minimumSize: const Size.fromHeight(56),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icon/kakao.png',
                  width: AppSizes.iconM,
                  height: AppSizes.iconM,
                ),
                const SizedBox(width: 8),
                const Text("카카오톡으로 시작하기"),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingL, vertical: AppSizes.paddingM),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("건너뛰기", style: TextStyle(color: AppColors.gray300)),
            Row(
              children: List.generate(messages.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.teal
                          : AppColors.gray100,
                    ),
                  ),
                );
              }),
            ),
            TextButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: const Text("다음",
                  style: TextStyle(color: AppColors.primary)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: messages.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (_, index) => _buildPage(
                titles[index],
                messages[index],
                imagePaths[index],
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }
}
