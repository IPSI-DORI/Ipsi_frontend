import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_default_screen.dart';
import 'package:ipsi_frontend/features/home/views/home_screen.dart';
import './features/chatbot/views/chat_screen.dart';
import 'core/ui/widgets/custom_bottom_navigation.dart';
import 'features/curriculum/views/curriculum_screen.dart';
import './features/mypage/views//mypage_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ChatScreen(),
    CurriculumDefaultScreen(),
    MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
