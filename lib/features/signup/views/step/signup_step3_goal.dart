import 'package:flutter/material.dart';
import '../../../../core/ui/components/text/app_dropdown.dart';
import '../../../../core/ui/components/text/section_title.dart';
import '../../../../core/utils/json_loader.dart';

class SignupStep3Goal extends StatefulWidget {
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
  State<SignupStep3Goal> createState() => _SignupStep3GoalState();
}

class _SignupStep3GoalState extends State<SignupStep3Goal> {
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
          subTitle: '를 정해주세요',
          subPrimaryTitle: '목표',
        ),
        AppDropdown<String>(
          title: '희망 대학교',
          items: universityList,
          hint: '희망하시는 대학교를 선택해주세요',
          value: widget.selectedGoalSchool,
          onChanged: (school) {
            final majors = universityMajorMap[school] ?? [];
            setState(() {
              majorList = majors;
            });
            widget.onGoalSchoolChanged(school);
          },
          hintText: '',
        ),
        AppDropdown<String>(
          title: '희망 전공',
          items: majorList,
          hint: '희망하시는 전공을 선택해주세요',
          value: widget.selectedGoalMajor,
          onChanged: widget.onGoalMajorChanged,
          hintText: '',
        ),
      ],
    );
  }
}
