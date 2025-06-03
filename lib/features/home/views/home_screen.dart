import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/chatbot/views/chat_screen.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_default_screen.dart';
import 'package:ipsi_frontend/features/home/views/home_main_view.dart';
import 'package:ipsi_frontend/features/mypage/views/mypage_screen.dart';

import '../../../core/ui/widgets/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeMainView(),
    ChatScreen(),
    CurriculumDefaultScreen(),
    MyPageScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
