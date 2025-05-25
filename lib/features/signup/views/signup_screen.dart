import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/components/header/signup_header.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/features/signup/views/signup_result_screen.dart';
import 'package:ipsi_frontend/features/signup/views/step/signup_step1_info.dart';
import 'package:ipsi_frontend/features/signup/views/step/signup_step2_exam.dart';
import 'package:ipsi_frontend/features/signup/views/step/signup_step3_goal.dart';
import 'package:ipsi_frontend/features/signup/views/step/signup_step4_style.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  bool _isStepValid = true;

  final TextEditingController _nicknameController = TextEditingController();
  String? _selectedGrade;
  String? _selectedKorean;
  String? _selectedMath;
  String? _selectedSocial;
  String? _selectedScience;
  String? _selectedSchool;
  String? _selectedMajor;
  String? _selectedGoalSchool;
  String? _selectedGoalMajor;
  String? _selectedQuestion1;
  String? _selectedQuestion2;
  String? _selectedQuestion3;
  String? _selectedQuestion4;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_validateStep);
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  // 모든 질문에 답했는지 유효성 검사
  void _validateStep() {
    final isDetail = _selectedGrade == "반수" || _selectedGrade == "재수";

    switch (_currentStep) {
      case 0:
        _isStepValid = _nicknameController.text.trim().isNotEmpty &&
            _selectedGrade != null &&
            (!isDetail || (_selectedSchool != null || _selectedMajor != null));
        break;
      case 1:
        _isStepValid = _selectedKorean != null &&
            _selectedMath != null &&
            (_selectedSocial != null || _selectedScience != null);
        break;
      case 2:
        _isStepValid =
            _selectedGoalSchool != null && _selectedGoalMajor != null;
      case 3:
        _isStepValid = _selectedQuestion1 != null &&
            _selectedQuestion2 != null &&
            _selectedQuestion3 != null &&
            _selectedQuestion4 != null;
    }
    setState(() {});
  }

  // 학년 선택
  void _onGradeChanged(String? value) {
    setState(() {
      _selectedGrade = value;
    });
    _validateStep();
  }

  void _handleBackPressed() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      Navigator.pop(context);
    }
  }

  // 현재 학교 선택
  void onSchoolChanged(String? value) {
    setState(() {
      _selectedSchool = value;
    });
    _validateStep();
  }

  // 현재 전공 선택
  void onMajorChanged(String? value) {
    setState(() {
      _selectedMajor = value;
    });
    _validateStep();
  }

  // 목표 대학교 선택
  void _onGoalSchoolChanged(String? value) {
    setState(() {
      _selectedGoalSchool = value;
    });
    _validateStep();
  }

  // 목표 전공 선택
  void _onGoalMajorChanged(String? value) {
    setState(() {
      _selectedGoalMajor = value;
    });
    _validateStep();
  }

  // 학습 스타일 질문1 선택
  void _onQuestion1Changed(String? value) {
    setState(() {
      _selectedQuestion1 = value;
    });
    _validateStep();
  }

  // 학습 스타일 질문2 선택
  void _onQuestion2Changed(String? value) {
    setState(() {
      _selectedQuestion2 = value;
    });
    _validateStep();
  }

  // 학습 스타일 질문3 선택
  void _onQuestion3Changed(String? value) {
    setState(() {
      _selectedQuestion3 = value;
    });
    _validateStep();
  }

  // 학습 스타일 질문4 선택
  void _onQuestion4Changed(String? value) {
    setState(() {
      _selectedQuestion4 = value;
    });
    _validateStep();
  }

  void _onKoreanChanged(String? value) {
    setState(() {
      _selectedKorean = value;
    });
    _validateStep();
  }

  void _onMathChanged(String? value) {
    setState(() {
      _selectedMath = value;
    });
    _validateStep();
  }

  void _onSocialChanged(String? value) {
    setState(() {
      _selectedSocial = value;
    });
    _validateStep();
  }

  void _onScienceChanged(String? value) {
    setState(() {
      _selectedScience = value;
    });
    _validateStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentStep = index;
                });
                _validateStep();
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingL,
                    vertical: AppSizes.paddingL,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignupHeader(
                        currentStep: _currentStep,
                        onBack: _handleBackPressed,
                      ),
                      if (_currentStep == 0)
                        SignupStep1Info(
                            nicknameController: _nicknameController,
                            selectedGrade: _selectedGrade,
                            onGradeChanged: _onGradeChanged,
                            onSchoolChanged: onSchoolChanged,
                            onMajorChanged: onMajorChanged,
                            isDetail: _selectedGrade == "반수" ||
                                _selectedGrade == "재수"),
                      if (_currentStep == 1)
                        SignupStep2Exam(
                            selectedKorean: _selectedKorean,
                            selectedMath: _selectedMath,
                            selectedSocial: _selectedSocial,
                            selectedScience: _selectedScience,
                            onKoreanChanged: _onKoreanChanged,
                            onMathChanged: _onMathChanged,
                            onSocialChanged: _onSocialChanged,
                            onScienceChanged: _onScienceChanged),
                      if (_currentStep == 2)
                        SignupStep3Goal(
                          nicknameController: _nicknameController,
                          selectedGoalMajor: _selectedGoalMajor,
                          onGoalMajorChanged: _onGoalMajorChanged,
                          selectedGoalSchool: _selectedGoalSchool,
                          onGoalSchoolChanged: _onGoalSchoolChanged,
                        ),
                      if (_currentStep == 3)
                        SignupStep4Style(
                            selectedQuestion1: _selectedQuestion1,
                            selectedQuestion2: _selectedQuestion2,
                            selectedQuestion3: _selectedQuestion3,
                            selectedQuestion4: _selectedQuestion4,
                            onQuestion1Changed: _onQuestion1Changed,
                            onQuestion2Changed: _onQuestion2Changed,
                            onQuestion3Changed: _onQuestion3Changed,
                            onQuestion4Changed: _onQuestion4Changed)
                      // 이후 단계도 if (_currentStep == 1) ... 식으로 추가 가능
                    ],
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AppButton(
          text: _currentStep == 3 ? "완료" : '다음',
          size: AppButtonSize.large,
          enabled: _isStepValid,
          onPressed: _isStepValid
              ? () => {
                    if (_currentStep < 3)
                      {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        )
                      }
                    else
                      {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const SignupResultScreen(
                                  nickname: 'nickname')),
                        )
                      }
                  }
              : null,
        ),
      ),
    );
  }
}
