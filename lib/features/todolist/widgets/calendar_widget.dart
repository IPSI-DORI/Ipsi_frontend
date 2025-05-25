import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Map<DateTime, int> completionMap; 

  CalendarWidget({
    required this.selectedDate,
    required this.onDateSelected,
    required this.completionMap,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime(2025, 5, 1); // 고정된 날짜로 예시
    final firstDay = DateTime(now.year, now.month, 1);
    final lastDay = DateTime(now.year, now.month + 1, 0);

    List<Widget> dayWidgets = [];

    for (int i = 0; i < firstDay.weekday - 1; i++) {
      dayWidgets.add(const SizedBox());
    }

    for (int i = 1; i <= lastDay.day; i++) {
      final day = DateTime(now.year, now.month, i);
      final isSelected = selectedDate.day == day.day;
      final completion = completionMap[day] ?? 0;

      Color bgColor;
      if (completion >= 100) {
        bgColor = Colors.teal;
      } else if (completion >= 70) {
        bgColor = Colors.tealAccent.shade400;
      } else if (completion >= 30) {
        bgColor = Colors.tealAccent.shade100;
      } else {
        bgColor = Colors.grey.shade300;
      }

      dayWidgets.add(GestureDetector(
        onTap: () => onDateSelected(day),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : bgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text('$i', style: TextStyle(color: Colors.white)),
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("2025년 5월", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: dayWidgets,
          ),
        ],
      ),
    );
  }
}
