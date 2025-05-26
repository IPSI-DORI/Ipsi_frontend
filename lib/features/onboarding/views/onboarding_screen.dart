import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/bottombar/onboarding_bottombar.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/signup/views/signup_screen.dart';
import '../../../core/constants/app_colors.dart';

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
        Image.asset('assets/images/characters/dori/dori.png', height: 200),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: AppSizes.font16, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  // 바텀바
  Widget _buildBottomBar() {
    if (_currentIndex == messages.length - 1) {
      return Padding(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: SizedBox(
          width: double.infinity,
          
          // 카카오톡 버튼
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow, // 배경색
              foregroundColor: AppColors.gray800,// 글자색
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radiusM)),
            ),
            // 수평 방향으로 위젯 나란히 배치
            child: Row(
              // 수평 방향에서 자식들을 가운데 정렬
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    'assets/images/icon/kakao.png',
                    width: AppSizes.iconM,
                    height: AppSizes.iconM),
                const SizedBox(width: 8), // 간격
                Text("카카오톡으로 시작하기"),
              ]
            )

          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL, vertical: AppSizes.paddingM),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("건너뛰기", style: TextStyle(color: AppColors.gray300)),
            Row(
              children: List.generate(messages.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.teal : AppColors.gray100,
                  ),
                );
              }),
            ),
            TextButton(
              onPressed: () {
                _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              child: const Text("다음", style: TextStyle(color: AppColors.primary)),
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
