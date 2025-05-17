// 네비게이션 관리 (GoRouter, named routes 등)

import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/splash/screens/splash_screen.dart';

class AppRoutes {
  static const String auth = '/auth';

  static Map<String, WidgetBuilder> get routes => {
    auth: (context) => SplashScreen()
  };
}
