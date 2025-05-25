import 'package:flutter/material.dart';

class ScheduleListWidget extends StatelessWidget {
  final DateTime date;
  final List<String> schedules;

  ScheduleListWidget({required this.date, required this.schedules});

  @override
  Widget build(BuildContext context) {
    final weekday = ["월", "화", "수", "목", "금", "토", "일"][date.weekday - 1];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${date.day}일 $weekday요일", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...schedules.map((title) => ListTile(
                title: Text(title),
                leading: const Icon(Icons.circle_outlined),
              )),
        ],
      ),
    );
  }
}
