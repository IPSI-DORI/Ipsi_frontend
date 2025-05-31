// 네비게이션 관리 (GoRouter, named routes 등)

import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/splash/views/splash_screen.dart';
import '../features/chatbot/views/chat_screen.dart';
import '../features/curriculum/views/curriculum_default_screen.dart';
import '../features/curriculum/views/curriculum_screen.dart';
import '../features/mypage/views/mypage_screen.dart';
import '../features/todolist/views/todolist_screen.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String chatbot = '/chatbot';
  static const String curriculum = './curriculum';
  static const String mypage = './mypage';
  static const String todolist = './todolist';

  static Map<String, WidgetBuilder> get routes => {
    auth: (context) => SplashScreen(),
    chatbot: (context) => ChatScreen(),
    curriculum: (context) => CurriculumDefaultScreen(),
    mypage: (context) => MyPageScreen(),
    todolist: (context) => TodolistScreen()

  };
}
