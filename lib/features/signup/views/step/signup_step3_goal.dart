import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/text/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/text/app_text_field.dart';
import 'package:ipsi_frontend/core/components/text/section_title.dart';

class SignupStep3Goal extends StatelessWidget {
  final TextEditingController nicknameController;
  final String? selectedGoalSchool;
  final String? selectedGoalMajor;
  final Function(String?) onGoalSchoolChanged;
  final Function(String?) onGoalMajorChanged;

  const SignupStep3Goal({
    super.key,
    required this.nicknameController,
    required this.selectedGoalSchool,
    required this.selectedGoalMajor,
    required this.onGoalSchoolChanged,
    required this.onGoalMajorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          subTitle: '를 정해주세요',
          subPrimaryTitle: '목표',
        ),
        AppDropdown<String>(
          title: '희망 대학교',
          items: ['서울대학교', '연세대학교', '고려대학교', '서강대', '성균관대', '한양대'],
          hint: '희망하시는 대학교를 선택해주세요',
          value: selectedGoalSchool,
          onChanged: onGoalSchoolChanged,
          hintText: '',
        ),
        AppDropdown<String>(
          title: '희망 전공',
          items: [
            '컴퓨터공학과',
            '소프트웨어공학과',
            '정보통신공학과',
            '인공지능학과',
          ],
          hint: '희망하시는 전공을 선택해주세요',
          value: selectedGoalMajor,
          onChanged: onGoalMajorChanged,
          hintText: '',
        ),
      ],
    );
  }
}
