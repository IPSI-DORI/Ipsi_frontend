import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('입시도리 로그인 화면', style: TextStyle(color: AppColors.primary))),
    );
  }
}
