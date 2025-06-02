import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/text/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/text/app_text_field.dart';
import 'package:ipsi_frontend/core/components/text/section_title.dart';
import 'package:ipsi_frontend/core/utils/json_loader.dart';

class SignupStep1Info extends StatefulWidget {
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
  State<SignupStep1Info> createState() => _SignupStep1InfoState();
}

class _SignupStep1InfoState extends State<SignupStep1Info> {
  Map<String, List<String>> universityMajorMap = {};
  List<String> universityList = [];
  List<String> majorList = [];

  @override
  void initState() {
    super.initState();
    loadUniversityMajorMap().then((map) {
      setState(() {
        universityMajorMap = map;
        universityList = map.keys.toList();
      });
    });
  }

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
          controller: widget.nicknameController,
        ),
        AppDropdown<String>(
          title: '학년',
          items: ['고등학교 1학년', '고등학교 2학년', '고등학교 3학년', '반수', '재수'],
          hint: '학년 또는 수능 준비 단계를 선택해주세요',
          value: widget.selectedGrade,
          onChanged: widget.onGradeChanged,
          hintText: '',
        ),
        if (widget.isDetail) ...[
          AppDropdown<String>(
            title: '현재 대학교',
            items: universityList,
            hint: '현재 재학중인 대학교를 선택해주세요',
            value: widget.selectedSchool,
            onChanged: (school) {
              final majors = universityMajorMap[school] ?? [];
              setState(() {
                majorList = majors;
              });
              widget.onSchoolChanged(school);
            },
            hintText: '',
          ),
          AppDropdown<String>(
            title: '현재 전공',
            items: majorList,
            hint: '현재 재학중인 대학교의 전공을 선택해주세요',
            value: widget.selectedMajor,
            onChanged: widget.onMajorChanged,
            hintText: '',
          ),
        ]
      ],
    );
  }
}
