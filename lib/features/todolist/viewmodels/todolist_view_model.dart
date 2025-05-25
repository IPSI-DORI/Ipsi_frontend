import 'package:flutter/material.dart';
import '../models/todolist_model.dart';

class CurriculumViewModel {
  DateTime selectedDate = DateTime(2025, 5, 23);

  final List<ScheduleModel> _schedules = [
    ScheduleModel(DateTime(2025, 5, 23), '강의명'),
    ScheduleModel(DateTime(2025, 5, 23), '강의명'),
    ScheduleModel(DateTime(2025, 5, 23), '강의명'),
  ];

  final Map<DateTime, int> completionMap = {
    DateTime(2025, 5, 1): 30,
    DateTime(2025, 5, 2): 70,
    DateTime(2025, 5, 3): 100,
    DateTime(2025, 5, 5): 100,
    DateTime(2025, 5, 7): 30,
    DateTime(2025, 5, 11): 70,
  };

  void selectDate(DateTime date) {
    selectedDate = date;
  }

  List<String> getSchedulesForDate(DateTime date) {
    return _schedules
        .where((e) => e.date.day == date.day)
        .map((e) => e.title)
        .toList();
  }
}
