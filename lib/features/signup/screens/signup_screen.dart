import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/app_dropdown.dart';
import 'package:ipsi_frontend/core/components/button/app_button.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/components/app_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  String? _selectedGrade; // 드롭다운 상태값 저장

  @override
  void dispose() {
    _nicknameController.dispose(); // 메모리 누수 방지
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 커스텀 인풋
            FractionallySizedBox(
              widthFactor: 0.9,
              child: AppTextField(
                  hintText: "한글, 영어 포함 2~12자로 입력하세요",
                  controller: _nicknameController
              ),
            ),

            const SizedBox(height: 16), // 간격

            // 커스텀 셀렉트
            FractionallySizedBox(
              widthFactor: 0.9,
              child: AppDropdown<String>(
                items: ['고등학교 1학년', '고등학교 2학년', '고등학교 3학년','반수','재수'],
                hint: '학년 또는 수능 준비 단계를 선택해주세요',
                value: _selectedGrade,
                onChanged: (value) {
                  setState(() {
                    _selectedGrade = value;
                  });
                }, hintText: '',
              ),
            ),
            
            // 커스텀 버튼
            AppButton(
              text: '다음',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}