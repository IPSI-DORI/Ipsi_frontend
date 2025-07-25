import 'package:flutter/material.dart';

import '../../../../core/ui/components/text/app_dropdown.dart';
import '../../../../core/ui/components/text/section_title.dart';

class SignupStep2Exam extends StatelessWidget {
  final String? selectedKorean;
  final String? selectedMath;
  final String? selectedSocial;
  final String? selectedScience;

  final Function(String?) onKoreanChanged;
  final Function(String?) onMathChanged;
  final Function(String?) onSocialChanged;
  final Function(String?) onScienceChanged;

  const SignupStep2Exam({
    super.key,
    required this.selectedKorean,
    required this.selectedMath,
    required this.selectedSocial,
    required this.selectedScience,
    required this.onKoreanChanged,
    required this.onMathChanged,
    required this.onSocialChanged,
    required this.onScienceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          subTitle: '을 알려주세요',
          subPrimaryTitle: '시험 과목',
        ),
        AppDropdown<String>(
          title: '국어',
          items: [
            "독서",
            "문학",
            "언어와매체",
            "화법과작문",
          ],
          hint: '수능 과목을 선택해주세요',
          value: selectedKorean,
          onChanged: onKoreanChanged,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '수학',
          items: [
            "수학1",
            "수학2",
            "확률과통계",
            "미적분",
            "기하",
          ],
          hint: '수능 과목을 선택해주세요',
          value: selectedMath,
          onChanged: onMathChanged,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '사회탐구',
          items: [
            '해당없음',
            "생활과 윤리",
            "윤리와 사상",
            "한국지리",
            "세계지리",
            "동아시아사",
            "세계사",
            "정치와 법",
            "경제",
            "사회/문화",
          ],
          hint: '수능 과목을 선택해주세요',
          value: selectedSocial,
          onChanged: onSocialChanged,
          hintText: '',
        ),

        AppDropdown<String>(
          title: '과학탐구',
          items: [
            '해당없음',
            "물리학1",
            "물리학2",
            "화학1",
            "화학2",
            "생명과학1",
            "생명과학2",
            "지구과학1",
            "지구과학2",
          ],
          hint: '수능 과목을 선택해주세요',
          value: selectedScience,
          onChanged: onScienceChanged,
          hintText: '',
        ),
      ],
    );
  }
}
