import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

import '../../../../core/ui/components/app_button.dart';
import '../../../../core/ui/components/header/back_title_header.dart';
import '../../../../core/ui/components/text/app_dropdown.dart';
import '../../../../core/ui/components/text/app_text_field.dart';
import 'grade_screen.dart';

class GradeAddScreen extends StatefulWidget {
  const GradeAddScreen({super.key});

  @override
  State<GradeAddScreen> createState() => _GradeAddScreenState();
}

class _GradeAddScreenState extends State<GradeAddScreen> {
  // 시험 년도 컨트롤러 생성
  final TextEditingController examYearController = TextEditingController();

  // 시험 원점수 컨트롤러 생성
  final TextEditingController examScoreController = TextEditingController();

  // 시험 백분위 컨트롤러 생성
  final TextEditingController examPercentileController =
      TextEditingController();

  // 시험 종류 셀렉트 선언
  String? selectedTExamTitleYear;

  // 시험 과목 셀렉트 선언
  String? selectedExamSubjectYear;

  // 시험 등급 셀렉트 선언
  String? selectedExamSubjectLevelYear;

  // 폼이 채워졌는지를 확인하는 리턴값이 bool인 함수
  bool get isFormFiled {
    return examYearController.text.trim().isNotEmpty ||
        examScoreController.text.trim().isNotEmpty ||
        examPercentileController.text.trim().isNotEmpty ||
        selectedTExamTitleYear != null ||
        selectedExamSubjectYear != null ||
        selectedExamSubjectLevelYear != null;
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
    examYearController.addListener(updateState);
    examScoreController.addListener(updateState);
    examPercentileController.addListener(updateState);
  }

  // TextEditingController는 Stateful한 객체이므로 수동으로 메모리 해제
  // 그렇지 않으면, 메모리에 남아 누수 발생
  @override
  void dispose() {
    examYearController.dispose();
    examScoreController.dispose();
    examPercentileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // 스크롤 가능한 영역
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BackTitleHeader(title: "성적 추가"),
        Expanded(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL,
                vertical: AppSizes.paddingS,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDropdown(
                      title: "시험 종류",
                      items: [
                        "11월 평가원 모의고사",
                        "9월 평가원 모의고사",
                        "6월 평가원 모의고사",
                        "3월 평가원 모의고사",
                      ],
                      hint: "시험 종류를 선택해주세요",
                      onChanged: (val) {
                        selectedTExamTitleYear = val;
                        updateState();
                      },
                      hintText: '',
                    ),
                    AppTextField(
                      title: "년도",
                      hintText: "년도를 입력해주세요",
                      controller: examYearController,
                    ),
                    AppDropdown(
                      title: "과목",
                      items: [
                        "독서",
                        "문학",
                        "언어와매체",
                        "화법과작문",
                        "수학1",
                        "수학2",
                        "확률과통계",
                        "미적분",
                        "기하",
                        "생활과 윤리",
                        "윤리와 사상",
                        "한국지리",
                        "세계지리",
                        "동아시아사",
                        "세계사",
                        "정치와 법",
                        "경제",
                        "사회/문화",
                        "물리학1",
                        "물리학2",
                        "화학1",
                        "화학2",
                        "생명과학1",
                        "생명과학2",
                        "지구과학1",
                        "지구과학2",
                        "한국사"
                      ],
                      hint: "과목을 선택해주세요",
                      onChanged: (val) {
                        selectedExamSubjectYear = val;
                        updateState();
                      },
                      hintText: '',
                    ),
                    AppTextField(
                      title: "원점수(득점)",
                      hintText: "성적표에 있는 원점수(득점)을 입력해주세요",
                      controller: examScoreController,
                    ),
                    AppDropdown(
                      title: "등급",
                      items: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
                      hint: "성적표에 있는 등급을 선택해주세요",
                      onChanged: (val) {
                        selectedExamSubjectLevelYear = val;
                        updateState();
                      },
                      hintText: '',
                    ),
                    AppTextField(
                      title: "백분위",
                      hintText: "성적표에 있는 백분위를 입력해주세요",
                      controller: examPercentileController,
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
          text: "등록하기",
          enabled: isFormFiled,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GradeScreen()),
            );
          },
        ),
      ),
    );
  }
}
