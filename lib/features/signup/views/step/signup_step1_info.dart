import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/app_text_field.dart';
import 'package:ipsi_frontend/core/components/text/section_title.dart';

class SignupStep1Info extends StatelessWidget {
  final TextEditingController nicknameController;
  final String? selectedGrade;
  final String? selectedSchool;
  final String? selectedMajor;
  final bool isDetail;
  final Function(String?) onGradeChanged;
  final Function(String?) onSchoolChanged;
  final Function(String?) onMajorChanged;

  const SignupStep1Info({
    super.key,
    required this.nicknameController,
    required this.selectedGrade,
    required this.onGradeChanged,
    this.selectedSchool,
    this.selectedMajor,
    required this.isDetail,
    required this.onSchoolChanged,
    required this.onMajorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: '반가워요!',
          subTitle: '를 입력해주세요',
          subPrimaryTitle: '회원정보',
        ),
        AppTextField(
          title: '닉네임',
          hintText: "한글, 영어 포함 2~12자로 입력하세요",
          controller: nicknameController,
        ),
        AppDropdown<String>(
          title: '학년',
          items: [
            '고등학교 1학년',
            '고등학교 2학년',
            '고등학교 3학년',
            '반수',
            '재수'
          ],
          hint: '학년 또는 수능 준비 단계를 선택해주세요',
          value: selectedGrade,
          onChanged: onGradeChanged,
          hintText: '',
        ),
        if (isDetail) ...[
          AppDropdown<String>(
            title: '현재 대학교',
            items: [
              '상위권',
              '중상위권',
              '중위권',
              '중하위권',
              '하위권',
            ],
            hint: '현재 재학중인 대학교를 선택해주세요',
            value: selectedSchool,
            onChanged: onSchoolChanged,
            hintText: '',
          ),
          AppDropdown<String>(
            title: '현재 전공',
            items: [
              '의학',
              '공학',
              '문과',
              '예체능',
            ],
            hint: '현재 재학중인 대학교의 전공을 선택해주세요',
            value: selectedMajor,
            onChanged: onMajorChanged,
            hintText: '',
          ),
        ]
      ],
    );
  }
}
