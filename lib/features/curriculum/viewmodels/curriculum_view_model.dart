import 'package:flutter/material.dart';

class CurriculumViewModel extends ChangeNotifier {
  int _currentPage = 0;
  List<String> selectedSubjects = List.filled(4, '');
  List<String> selectedDetailSubjects = List.filled(4, '');
  
  // 시간 관련 필드 추가
  String selectedTimeSlot = '';
  List<String> selectedDays = [];
  
  int get currentPage => _currentPage;
  
  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
  
  void setSubject(int page, String subject) {
    selectedSubjects[page] = subject;
    notifyListeners();
  }
  
  void setDetailSubject(int page, String detailSubject) {
    selectedDetailSubjects[page] = detailSubject;
    notifyListeners();
  }
  
  void setTimeSlot(String timeSlot) {
    selectedTimeSlot = timeSlot;
    notifyListeners();
  }
  
  void toggleDay(String day) {
    if (selectedDays.contains(day)) {
      selectedDays.remove(day);
    } else {
      selectedDays.add(day);
    }
    notifyListeners();
  }
  
  bool canProceed(int page) {
    if (page < 4) {
      // 기존 과목 선택 페이지
      return selectedSubjects[page].isNotEmpty && 
             selectedDetailSubjects[page].isNotEmpty;
    } else if (page == 4) {
      // 시간과 요일 선택 페이지
      return selectedTimeSlot.isNotEmpty && selectedDays.isNotEmpty;
    }
    return false;
  }
}