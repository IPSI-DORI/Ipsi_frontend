import 'package:flutter/material.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/schedule_list_widget.dart';
import '../viewmodels/todolist_view_model.dart';

class CurriculumScreen extends StatefulWidget {
  @override
  _CurriculumScreenState createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  final viewModel = CurriculumViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("커리큘럼"), centerTitle: true),
      body: Column(
        children: [
          CalendarWidget(
            selectedDate: viewModel.selectedDate,
            onDateSelected: (date) {
              setState(() {
                viewModel.selectDate(date);
              });
            },
            completionMap: viewModel.completionMap,
          ),
          Expanded(
            child: ScheduleListWidget(
              date: viewModel.selectedDate,
              schedules: viewModel.getSchedulesForDate(viewModel.selectedDate),
            ),
          ),
        ],
      ),
    );
  }
}
