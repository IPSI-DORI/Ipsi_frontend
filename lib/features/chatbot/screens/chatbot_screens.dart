import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('입시도리 챗봇 화면', style: TextStyle(color: AppColors.primary))),
    );
  }
}
