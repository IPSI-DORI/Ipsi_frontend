import 'package:flutter/material.dart';

class CurriculumViewModel extends ChangeNotifier {
  int _currentPage = 0;

  List<String> selectedSubjects = List.filled(4, '');
  List<String> selectedDetailSubjects = List.filled(4, '');
  List<String> selectedExamType = List.filled(4, '');
  
  // 선택된 강의 인덱스 - int?로 변경 (단일 선택)
  int? selectedLectureIndex;

  // 시간 관련
  String selectedTimeSlot = '';
  List<String> selectedDays = [];

  // 성적 입력
  final Map<String, String> examScores = {}; // 과목별 점수
  String selectedExamTypeValue = '';

  // 설문
  final Map<String, String> surveyAnswers = {};

  // 추가 요청사항
  String additionalRequest = '';

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

  // 강의 선택 메서드 수정
  void setSelectedLecture(int index) {
    selectedLectureIndex = index;
    notifyListeners();
  }

  // 선택 초기화 메서드 추가
  void clearSelection() {
    selectedLectureIndex = null;
    notifyListeners();
  }

  void addDay(String day) {
    if (!selectedDays.contains(day)) {
      selectedDays.add(day);
      notifyListeners();
    }
  }

   void removeDay(String day) {
    selectedDays.remove(day);
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

  void setExamType(String examType) {
    selectedExamTypeValue = examType;
    notifyListeners();
  }

  String getExamScore(String subject) => examScores[subject] ?? '';

  void setExamScore(String subject, String score) {
    examScores[subject] = score;
    notifyListeners();
  }

  String getSurveyAnswer(String question) => surveyAnswers[question] ?? '';

  void setSurveyAnswer(String question, String answer) {
    surveyAnswers[question] = answer;
    notifyListeners();
  }

  void setAdditionalRequest(String value) {
    additionalRequest = value;
    notifyListeners();
  }

  bool canProceed(int page) {
    switch (page) {
      case 0:
        return selectedSubjects[0].isNotEmpty &&
               selectedDetailSubjects[0].isNotEmpty;
      case 1:
        return selectedTimeSlot.isNotEmpty &&
               selectedDays.isNotEmpty;
      case 2:
        return selectedExamType.isNotEmpty &&
                selectedExamTypeValue.isNotEmpty;
      case 3:
        return surveyAnswers.isNotEmpty;
      case 4: 
        // 강의 선택 페이지 조건 수정
        return selectedLectureIndex != null;
      default:
        return true;
    }
  }
}