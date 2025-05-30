import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/mypage/views/grade/grade_add_screen.dart';
import '../../../../core/theme/text_theme.dart';
import 'grade_detail_screen.dart';

class GradeScreen extends StatefulWidget {
  const GradeScreen({super.key});

  // State: 화면의 상태를 저장하는 틀
  // <GradeScreen>: State는 화면을 위한 상태
  // createState(): StatefulWidget을 쓰면 Flutter가 상태 관리를 위해 자동으로 찾는 함수
  // => 한 줄짜리 함수로 만들 때 쓰는 문법 (= { return ; })
  // _: private
  @override
  // 이 화면을 처음 그릴 때 _GradeScreenState()라는 객체로 상태 관리
  // 시작할 때 한 번만 실행
  State<GradeScreen> createState() => _GradeScreenState();
}

// 상태 관리 클래스는 부모를 상속
class _GradeScreenState extends State<GradeScreen> {
  String? _selectedExamTitle;
  String? _selectedExamYear;

  final TextEditingController _examYearController = TextEditingController();

  // 시험 제목 선택
  void _onExamTitleChanged(String? value) {
    setState(() {
      _selectedExamTitle = value;
    });
  }

  // 선택된 달 설정 (변동돼서 final 불가능)
  String selectedMonths = "전체";

  // final: 한 번만 값 지정 가능 (변경 불가능)
  // 필터링할 달들을 배열에 담음
  final List<String> months = ["전체", "3월", "6월", "9월", "11월"];

  // 시험 제목들을 배열에 담음
  final List<String> examTitles = [
    "2024년 11월 평가원 모의고사",
    "2024년 9월 평가원 모의고사",
    "2024년 6월 평가원 모의고사",
    "2024년 3월 평가원 모의고사",
  ];

  // 함수 선언: 반환타입 (get) 함수이름 (){ return 값 }
  // get: getter 함수인데, 변수처럼 사용 가능해서 () 안 붙임
  List<String> get monthGrades {
    if (selectedMonths == "전체") return examTitles;

    // where(): Dart의 List에서 제공하는 메서드로서, 특정 조건을 만족하는 요소만 필터링
    // List 이름.contains(): List에서 특정값 존재 여부 확인
    // toList(): 리스트로 변환
    // examTitles 의 원소를 돌면서 selectedMonths와 일치한 title만 찾아서 리스트로 바꿈
    return examTitles.where((title) => title.contains(selectedMonths)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          BackTitleHeader(title: "성적 관리"),

          // 필터 버튼
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: months.map((month) => _buildFilterClip(month)).toList(),
            ),
          ),

          // 카드 리스트
          Expanded(
            child: ListView(
                children: monthGrades
                    .map((title) => _buildGradeCard(context, title))
                    .toList()),
          ),

          // SafeArea: 폰의 안전 영역을 자동으로 피하게 도와주는 위젯
          SafeArea(
            minimum: EdgeInsets.all(AppSizes.paddingL),
            child:
                // 추가하기 버튼
                AppButton(
              size: AppButtonSize.large,
              text: "추가하기",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GradeAddScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterClip(String month) {
    return ChoiceChip(
      showCheckmark: false,
      label: Text(month),
      selected: selectedMonths == month,
      onSelected: (_) {
        setState(() {
          selectedMonths = month;
        });
      },
      shape: StadiumBorder(
          side: BorderSide(
              color: selectedMonths == month
                  ? AppColors.gray800
                  : AppColors.gray200)),
      selectedColor: AppColors.gray800,
      labelStyle: TextStyle(
          color: selectedMonths == month ? AppColors.white : AppColors.gray300),
      backgroundColor: AppColors.white,
    );
  }

  Widget _buildGradeCard(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL, vertical: AppSizes.paddingXS),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.gray0,
          borderRadius: BorderRadius.circular(AppSizes.radiusXL)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 취소 아이콘
          Row(
            children: [
              Text(title, style: TextTheme().titleLarge),
              Spacer(),
              Image.asset(
                "assets/images/icon/cancel.png",
                height: 24,
                width: 24,
              ),
            ],
          ),

          const SizedBox(height: AppSizes.padding3XS),

          Row(
            children: [
              Text(
                "국어",
                style:
                    appTextTheme.bodySmall?.copyWith(color: AppColors.gray500),
              ),
              Text(" | ",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text("수학",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text(" | ",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
              Text("탐구",
                  style: appTextTheme.bodySmall
                      ?.copyWith(color: AppColors.gray500)),
            ],
          ),

          const SizedBox(height: AppSizes.paddingXS),

          AppButton(
              size: AppButtonSize.medium,
              style: AppButtonStyle.outlined,
              text: "상세보기",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GradeDetailScreen()),
                );
              })
        ],
      ),
    );
  }
}
