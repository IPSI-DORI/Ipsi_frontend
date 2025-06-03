import 'package:flutter/material.dart';
import '../../../../core/ui/components/text/app_dropdown.dart';
import '../../../../core/ui/components/text/section_title.dart';

class SignupStep4Style extends StatelessWidget {
  final String? selectedQuestion1;
  final String? selectedQuestion2;
  final String? selectedQuestion3;
  final String? selectedQuestion4;
  final Function(String?) onQuestion1Changed;
  final Function(String?) onQuestion2Changed;
  final Function(String?) onQuestion3Changed;
  final Function(String?) onQuestion4Changed;


  const SignupStep4Style({
    super.key,
    required this.selectedQuestion1,
    required this.selectedQuestion2,
    required this.selectedQuestion3,
    required this.selectedQuestion4,
    required this.onQuestion1Changed,
    required this.onQuestion2Changed,
    required this.onQuestion3Changed,
    required this.onQuestion4Changed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          subTitle: '을 알려주세요',
          subPrimaryTitle: '학습 스타일',
        ),
        AppDropdown<String>(
          title: '선생님이 칠판 가득 설명할 때, 나는?',
          items: [
            '일단 대충 듣고… 실전에서 부딪혀봐야 알지!',
            '일단 머리에서 이해한 후에 정리하자!',
            '헷갈리는 건 다시 설명해주실 때 완전 이해돼',
            '설명 중간에도 멈춰서 메모하는 게 국룰이지.'
          ],
          hint: '선택해주세요',
          value: selectedQuestion1,
          onChanged: onQuestion1Changed,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '시험 일주일 전, 나는?',
          items: [
            '지금은 아직 쉴 때야… 3일 전부터 미쳐 돌지!',
            '큰 흐름부터 이해하고 나서 공부 루트를 짜야지!',
            '인강 한 편 켜놓고 따라가다 보면 감 오겠지?',
            '이미 스케줄표는 완성됐지. 오늘은 3단원 복습할 차례야.'
          ],
          hint: '선택해주세요',
          value: selectedQuestion2,
          onChanged: onQuestion2Changed,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '시험 하루 전, 나는?',
          items: [
            '이불 속에서 커피 들고 정신줄 붙잡으며 벼락치기 중',
            '헷갈렸던 개념 다시 개념서랑 연결해서 이해하는 중',
            '이어폰 끼고 진도 두 배속으로 끝내는 중',
            '요약노트 다시 정리하며 복습 루틴 중'
          ],
          hint: '선택해주세요',
          value: selectedQuestion3,
          onChanged: onQuestion3Changed,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '누가 정리해준 요약본 줬을 때, 나는?',
          items: [
            '땡큐~ 이걸로 하루 만에 뒤집는다!',
            '고마워! 근데 왜 이렇게 정리된 거지? 이해가 잘 안되는데..',
            '혹시 이거 같이 설명해줄 수 있어…?',
            '오케이, 이건 참고용. 난 다시 내 스타일로 정리할래.'
          ],
          hint: '선택해주세요',
          value: selectedQuestion4,
          onChanged: onQuestion4Changed,
          hintText: '',
        ),
      ],
    );
  }
}
