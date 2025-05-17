// 네비게이션 관리 (GoRouter, named routes 등)

import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/splash/screens/splash_screen.dart';
import '../features/chatbot/views/chat_screen.dart';
import '../features/curriculum/screens/curriculum_screen.dart';
import '../features/mypage/screens/mypage_screen.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String chatbot = '/chatbot';
  static const String curriculum = './curriculum';
  static const String mypage = './mypage';

  static Map<String, WidgetBuilder> get routes => {
    auth: (context) => SplashScreen(),
    chatbot: (context) => ChatScreen(),
    curriculum: (context) => CurriculumScreen(),
    mypage: (context) => MyPageScreen()
  };
}
