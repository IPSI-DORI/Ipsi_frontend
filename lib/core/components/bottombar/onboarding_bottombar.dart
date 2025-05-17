import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class OnboardingBottomBar extends StatelessWidget {

  // 속성 정의
  final bool isLastPage; // 마지막 페이지인지
  final int currentIndex; // 현재 몇 번째 페이지인지
  final int totalPageCount; // 전체 몇 페이지인지
  final VoidCallback onSkip; // 건너뛰기 버튼 눌렀을 때 실행할 함수
  final VoidCallback onNext; // 다음 버튼 눌렀을 때 실행할 함수
  final VoidCallback onkakako; // 카카오 버튼 눌렀을 떄 실행할 함수

  // 생성자 정의
  const OnboardingBottomBar({
    //  부모 클래스의 key값을 자식 생성자에 전달
    super.key,
    required this.isLastPage,
    required this.currentIndex,
    required this.totalPageCount,
    required this.onSkip,
    required this.onNext,
    required this.onkakako
  });


  // ui
  @override
  Widget build(BuildContext context) {
    if (isLastPage) {   // 마지막 페이지일 경우
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,

          // 카카오톡 버튼
          child: ElevatedButton(
              onPressed: onkakako,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFE812), // 배경색
                foregroundColor: AppColors.gray800, // 글자색
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              // 수평 방향으로 위젯 나란히 배치
              child: Row(
                // 수평 방향에서 자식들을 가운데 정렬
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        'assets/images/icon/kakao.png',
                        width: 24,
                        height: 24),
                    const SizedBox(width: 8), // 간격
                    Text("카카오톡으로 시작하기"),
                  ]
              )
          ),
        ),
      );
    } else {   // 마지막 페이지가 아닐 경우
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 3가지 기능을 가진 자식
          children: [
            // 마지막 페이지로 넘어가는 건너뛰기 텍스트 버튼
            TextButton(
              onPressed: onSkip,
              child: const Text(
                  "건너뛰기", style: TextStyle(color: AppColors.gray300)),
            ),
            // 현재(primaryColor)와 전체 인덱스(gray100)를 표시하는 동그라미들
            Row(
              children: List.generate(totalPageCount, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.teal : AppColors
                        .gray100,
                  ),
                );
              }),
            ),
            // 다음 페이지로 넘어가는 다음 텍스트 버튼
            TextButton(
              onPressed: onNext,
              child: const Text(
                  "다음", style: TextStyle(color: AppColors.primary)),
            ),
          ],
        ),
      );
    }
  }
}
