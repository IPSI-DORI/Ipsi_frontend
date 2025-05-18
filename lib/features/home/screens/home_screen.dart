import 'package:flutter/material.dart';
import 'package:ipsi_frontend/features/chatbot/views/chat_screen.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_screen.dart';
import '../../../core/widgets/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('홈 화면')),
    ChatScreen(),
    CurriculumScreen(),
    Center(child: Text('마이페이지 화면')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
