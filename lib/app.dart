import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Pretendard",
        ),
      title: '입시도리',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.curriculum,
      routes: AppRoutes.routes,
    );
  }
}

