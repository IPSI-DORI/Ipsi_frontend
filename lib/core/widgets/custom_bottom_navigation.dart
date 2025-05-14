import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final List<_NavItem> items = [
      _NavItem('홈', 'home'),
      _NavItem('챗봇', 'chatbot'),
      _NavItem('커리큘럼', 'curriculum'),
      _NavItem('마이', 'mypage'),
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: const Color(0xFF4BC7A6),
      unselectedItemColor: const Color(0xFFBDBDBD),
      showUnselectedLabels: true,
      items: items.asMap().entries.map((entry) {
        final i = entry.key;
        final item = entry.value;
        final isSelected = i == selectedIndex;

        return BottomNavigationBarItem(
          label: item.label,
          icon: Image.asset(
            'assets/images/${item.iconName}${isSelected ? '_click' : ''}.png',
            width: 24,
            height: 24,
          ),
        );
      }).toList(),
    );
  }
}

class _NavItem {
  final String label;
  final String iconName;

  _NavItem(this.label, this.iconName);
}
