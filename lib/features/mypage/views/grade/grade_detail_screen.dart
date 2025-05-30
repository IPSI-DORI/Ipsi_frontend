import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/app_button.dart';
import 'package:ipsi_frontend/core/components/header/back_title_header.dart';
import 'package:ipsi_frontend/core/components/text/app_text_field.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'grade_screen.dart';

class GradeDetailScreen extends StatefulWidget {
  const GradeDetailScreen({super.key});

  @override
  State<GradeDetailScreen> createState() => _GradeDetailScreenState();
}

class _GradeDetailScreenState extends State<GradeDetailScreen> {
  // 시험 과목 성적 컨트롤러 생성
  final TextEditingController koreanScoreController = TextEditingController();
  final TextEditingController koreanGradeController = TextEditingController();
  final TextEditingController koreanPercentileController =
      TextEditingController();

  final TextEditingController mathScoreController = TextEditingController();
  final TextEditingController mathGradeController = TextEditingController();
  final TextEditingController mathPercentileController =
      TextEditingController();

  final TextEditingController scienceScoreController = TextEditingController();
  final TextEditingController scienceGradeController = TextEditingController();
  final TextEditingController sciencePercentileController =
      TextEditingController();

  // 폼이 채워졌는지를 확인하는 리턴값이 bool인 함수
  bool get isFormFiled {
    return koreanScoreController.text.trim().isNotEmpty ||
        koreanGradeController.text.trim().isNotEmpty ||
        koreanPercentileController.text.trim().isNotEmpty ||
        mathScoreController.text.trim().isNotEmpty ||
        mathGradeController.text.trim().isNotEmpty ||
        mathPercentileController.text.trim().isNotEmpty ||
        scienceScoreController.text.trim().isNotEmpty ||
        scienceGradeController.text.trim().isNotEmpty ||
        sciencePercentileController.text.trim().isNotEmpty;
  }

  // 값이 변할 때마다 UI 생신하는 함수
  void updateState() {
    setState(() {});
  }

  // TextEditingController는 Stateful한 객체이므로 수동으로 메모리 해제
  // 그렇지 않으면, 메모리에 남아 누수 발생
  @override
  void dispose() {
    koreanScoreController.dispose();
    koreanGradeController.dispose();
    koreanPercentileController.dispose();

    mathScoreController.dispose();
    mathGradeController.dispose();
    mathPercentileController.dispose();

    scienceScoreController.dispose();
    scienceGradeController.dispose();
    sciencePercentileController.dispose();
    super.dispose();
  }

  // TextFiled의 내영이 바뀔 때마다 버튼 활성화 여부를 판단하는 함수
  @override
  void initState() {
    // 부모 클래스(State)의 기능 먼저 실행
    super.initState();
    // TextFild의 값이 바뀔 떄마다 addLister 콜백 함수가 updateState 함수 호출
    koreanScoreController.addListener(updateState);
    koreanGradeController.addListener(updateState);
    koreanPercentileController.addListener(updateState);

    mathScoreController.addListener(updateState);
    mathGradeController.addListener(updateState);
    mathPercentileController.addListener(updateState);

    scienceScoreController.addListener(updateState);
    scienceGradeController.addListener(updateState);
    sciencePercentileController.addListener(updateState);
  }

  // UI
  @override
  Widget build(BuildContext context) {
    TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더
            BackTitleHeader(title: "성적 조회"),

            // 타이틀
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL, vertical: AppSizes.paddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "N",
                        style: appTextTheme.titleLarge,
                      ),
                      Text(
                        "년",
                        style: appTextTheme.titleLarge,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "N월 평가원 모의고사",
                        style: appTextTheme.titleLarge,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "과목",
                        style: appTextTheme.bodyLarge
                            ?.copyWith(color: AppColors.gray300),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "|",
                        style: appTextTheme.bodyLarge
                            ?.copyWith(color: AppColors.gray300),
                      ),
                      const SizedBox(width: 10),
                      Text("과목",
                          style: appTextTheme.bodyLarge
                              ?.copyWith(color: AppColors.gray300)),
                      const SizedBox(width: 10),
                      Text(
                        "|",
                        style: appTextTheme.bodyLarge
                            ?.copyWith(color: AppColors.gray300),
                      ),
                      const SizedBox(width: 10),
                      Text("과목",
                          style: appTextTheme.bodyLarge
                              ?.copyWith(color: AppColors.gray300))
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 구분선
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.gray0,
            ),

            // 과목 성적
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
              child: Column(
                children: [
                  // 과목 타이틀
                  Row(
                    children: [
                      Text(
                        "과목",
                        style: appTextTheme.titleLarge,
                      ),
                    ],
                  ),
                  AppTextField(
                      title: "원점수(득점)",
                      hintText: "N",
                      controller: koreanScoreController),
                  AppTextField(
                      title: "등급",
                      hintText: "N",
                      controller: koreanGradeController),
                  AppTextField(
                      title: "백분위",
                      hintText: "N",
                      controller: koreanPercentileController),

                  const SizedBox(height: AppSizes.paddingL),

                  // 과목 타이틀
                  Row(
                    children: [
                      Text(
                        "과목",
                        style: appTextTheme.titleLarge,
                      ),
                    ],
                  ),
                  AppTextField(
                      title: "원점수(득점)",
                      hintText: "N",
                      controller: mathScoreController),
                  AppTextField(
                      title: "등급",
                      hintText: "N",
                      controller: mathGradeController),
                  AppTextField(
                      title: "백분위",
                      hintText: "N",
                      controller: mathPercentileController),

                  const SizedBox(height: AppSizes.paddingL),

                  // 과목 타이틀
                  Row(
                    children: [
                      Text(
                        "과목",
                        style: appTextTheme.titleLarge,
                      ),
                    ],
                  ),
                  AppTextField(
                      title: "원점수(득점)",
                      hintText: "N",
                      controller: scienceScoreController),
                  AppTextField(
                      title: "등급",
                      hintText: "N",
                      controller: scienceGradeController),
                  AppTextField(
                      title: "백분위",
                      hintText: "N",
                      controller: sciencePercentileController),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
              child: AppButton(
                size: AppButtonSize.large,
                text: "수정하기",
                enabled: isFormFiled,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GradeScreen()),
                  );
                },
              ),
            )
          ],
        ))));
  }
}
