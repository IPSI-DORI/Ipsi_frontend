import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/utils/json_loader.dart';
import 'package:ipsi_frontend/features/mypage/views/mypage_screen.dart';
import '../../../core/ui/components/app_button.dart';
import '../../../core/ui/components/header/back_title_header.dart';
import '../../../core/ui/components/text/app_dropdown.dart';
import '../../../core/ui/components/text/app_text_field.dart';

class ProfileScreen extends StatefulWidget {
  final String? selectedSchool;
  final String? selectedMajor;
  final Function(String?) onSchoolChanged;
  final Function(String?) onMajorchanged;

  const ProfileScreen(
      {super.key,
      this.selectedSchool,
      this.selectedMajor,
      required this.onSchoolChanged,
      required this.onMajorchanged});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 닉네임 입력 컨트롤러 셍성
  final TextEditingController nicknameController = TextEditingController();

  // 학년 셀렉트 선언
  String? selectedGrade;

  // 대학교 셀렉트 선언
  String? selectedUniversity;

  // 전공 셀렉트 선언
  String? selectedMajor;

  // 학교 셀렉트 선언
  Map<String, List<String>> universityMajorMap = {};
  List<String> universityList = [];
  List<String> majorList = [];

  // 폼이 채워졌는지를 확인하는 리턴값이 bool인 함수
  bool get isFormFiled {
    return nicknameController.text.trim().isNotEmpty ||
        selectedGrade != null ||
        selectedUniversity != null ||
        selectedMajor != null;
  }

  // 값이 변할 때마다 UI 생신하는 함수
  void updateState() {
    setState(() {});
  }

  // TextFiled의 내영이 바뀔 때마다 버튼 활성화 여부를 판단하는 함수
  @override
  void initState() {
    // 부모 클래스(State)의 기능 먼저 실행
    super.initState();
    // TextFild의 값이 바뀔 떄마다 addLister 콜백 함수가 updateState 함수 호출
    nicknameController.addListener(updateState);
    loadUniversityMajorMap().then((map) {
      universityMajorMap = map;
      universityList = map.keys.toList();
    });
  }

  // TextEditingController는 Stateful한 객체이므로 수동으로 메모리 해제
  // 그렇지 않으면, 메모리에 남아 누수 발생
  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // 스크롤 가능한 영역
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackTitleHeader(title: "프로필 편집"),
        Expanded(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL,
                vertical: AppSizes.paddingS,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      title: "닉네임",
                      hintText: "새로운 닉네임을 입력해주세요",
                      controller: nicknameController,
                    ),
                    AppDropdown(
                      title: "학년",
                      items: ['고등학교 1학년', '고등학교 2학년', '고등학교 3학년', '반수', '재수'],
                      hint: "새로운 학년을 선택해주세요",
                      onChanged: (val) {
                        selectedGrade = val;
                        updateState();
                      },
                      hintText: '',
                    ),
                    AppDropdown(
                      title: "희망 대학교",
                      items: universityList,
                      hint: "새로운 목표 대학교를 선택해주세요",
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
                    AppDropdown(
                      title: "희망 전공",
                      items: majorList,
                      hint: "새로운 목표 전공을 입력해주세요",
                      value: widget.selectedMajor,
                      onChanged: widget.onMajorchanged,
                      hintText: '',
                    ),
                  ]) // 버튼과 간격
              ),
        ),
      ]),

      // 버튼은 하단 고정
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppSizes.paddingL),
        child: AppButton(
          size: AppButtonSize.large,
          enabled: isFormFiled,
          text: "수정하기",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPageScreen()),
            );
          },
        ),
      ),
    );
  }
}
