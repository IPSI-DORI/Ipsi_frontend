import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodolistScreen extends StatefulWidget {
  @override
  _TodolistScreenState createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  DateTime selectedDate = DateTime.now();
  late PageController pageController;
  int currentMonthIndex = DateTime.now().month - 1; // 0-based index

  // 완료도별 SVG 아이콘 경로 정의
  final Map<String, String> completionSvgs = {
    '0-30%': 'assets/svg/check_30.svg',
    '-70%': 'assets/svg/check_70.svg',
    '-100%': 'assets/svg/check_100.svg',
  };

  // 더미 강의 데이터
  final List<Map<String, dynamic>> lectureData = [
    {
      'title': '현대문학의 이해와 분석',
      'type': '무료',
      'instructor': '김현수',
      'duration': '45분',
      'key': 'lecture_0',
    },
    {
      'title': '고전문학 작품 해석',
      'type': '유료',
      'instructor': '박민정',
      'duration': '38분',
      'key': 'lecture_1',
    },
    {
      'title': '문법의 기초와 활용',
      'type': '무료',
      'instructor': '이서영',
      'duration': '52분',
      'key': 'lecture_2',
    },
    {
      'title': '독해력 향상 전략',
      'type': '유료',
      'instructor': '최준호',
      'duration': '41분',
      'key': 'lecture_3',
    },
  ];

  // 체크박스 상태 관리
  Map<String, bool> scheduleCheckStates = {
    "lecture_0": false,
    "lecture_1": false,
    "lecture_2": false,
    "lecture_3": false,
  };

  // 샘플 데이터 - 월별, 날짜별 완료도
  final Map<int, Map<int, String>> monthlyCompletionMap = {
    1: {5: '-100%', 12: '0-30%', 18: '-70%'},
    2: {3: '-100%', 14: '-70%', 21: '0-30%'},
    3: {7: '-100%', 15: '-100%', 22: '0-30%'},
    4: {2: '-70%', 9: '-100%', 16: '0-30%'},
    5: {
      1: '-100%',
      2: '-100%',
      3: '0-30%',
      5: '-100%',
      7: '-100%',
      8: '0-30%',
      11: '-70%',
    },
    6: {4: '-100%', 11: '0-30%', 25: '-70%'},
    7: {8: '-100%', 17: '-100%', 29: '0-30%'},
    8: {6: '-70%', 13: '-100%', 20: '0-30%'},
    9: {1: '-100%', 15: '-70%', 28: '-100%'},
    10: {10: '0-30%', 18: '-100%', 31: '-70%'},
    11: {5: '-100%', 12: '0-30%', 24: '-70%'},
    12: {3: '-70%', 15: '-100%', 25: '0-30%'},
  };

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentMonthIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "커리큘럼",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 4),
              child: Text(
              "국어 완전정복 패키지",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
              "무료 | 남치열 | 176분(4강)",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              ),
            ),

            // 달력
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 월 표시와 범례를 같은 행에 배치
                    Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      // 월 이동 버튼과 월 표시
                      Row(
                        children: [
                        Text(
                          "2025년 ${currentMonthIndex + 1}월",
                          style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          ),
                        ),
                        ],
                      ),
                      // 범례
                      Row(
                        children: [
                        _buildLegendItem("assets/svg/check_30.svg"),
                        SizedBox(width: 4),
                        Text("0~30%", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                        SizedBox(width: 12),
                        _buildLegendItem("assets/svg/check_70.svg"),
                        SizedBox(width: 4),
                        Text("~70%", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                        SizedBox(width: 12),
                        _buildLegendItem("assets/svg/check_100.svg"),
                        SizedBox(width: 4),
                        Text("100%", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                        ],
                      ),
                      ],
                    ),
                    ),

                  // 요일 헤더
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['일', '월', '화', '수', '목', '금', '토']
                        .map((day) => SizedBox(
                              width: 35,
                              child: Text(
                                day,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ))
                        .toList(),
                  ),

                  SizedBox(height: 15),

                  // 달력 PageView
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentMonthIndex = index;
                          selectedDate = DateTime(2025, index + 1, 1);
                        });
                      },
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return _buildMonthCalendar(index + 1);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // 일정 목록
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${selectedDate.day}일 ${_getWeekdayName(selectedDate.weekday)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: lectureData.length,
                    itemBuilder: (context, index) {
                      final lecture = lectureData[index];
                      return _buildScheduleItem(
                        lecture['title'],
                        lecture['type'],
                        lecture['instructor'],
                        lecture['duration'],
                        lecture['key'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String svgPath) {
    return Container(
      width: 16,
      height: 16,
      child: SvgPicture.asset(
        svgPath,
        width: 16,
        height: 16,
      ),
    );
  }

  Widget _buildMonthCalendar(int month) {
    final firstDayOfMonth = DateTime(2025, month, 1);
    final lastDayOfMonth = DateTime(2025, month + 1, 0);
    final startOfCalendar = firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday % 7));

    List<Widget> calendarDays = [];

    for (int i = 0; i < 42; i++) {
      final date = startOfCalendar.add(Duration(days: i));
      final isCurrentMonth = date.month == month;
      final dayNumber = date.day;

      // SVG와 배경 결정
      Widget? svgWidget;
      Color backgroundColor = Colors.grey[200]!; // 기본 회색 배경

      if (isCurrentMonth) {
        backgroundColor = Colors.white; // 항상 흰색 배경
        if (monthlyCompletionMap[month] != null &&
            monthlyCompletionMap[month]!.containsKey(dayNumber)) {
          // 완료도에 따른 SVG 표시
          String completionLevel = monthlyCompletionMap[month]![dayNumber]!;
          svgWidget = SvgPicture.asset(
            completionSvgs[completionLevel]!,
            width: 20,
            height: 20,
          );
        } else {
          // SVG가 없을 때 회색 네모
          svgWidget = Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }
      }

      calendarDays.add(
        GestureDetector(
          onTap: () {
            if (isCurrentMonth) {
              setState(() {
                selectedDate = date;
              });
            }
          },
          child: Container(
            width: 35,
            height: 48, // 기존 35에서 48로 높이 증가
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: isCurrentMonth ? backgroundColor : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: selectedDate.day == dayNumber && selectedDate.month == month
                  ? Border.all(color: Color(0xFF43D4D2), width: 2)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (svgWidget != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2), // 공간 확보를 위해 패딩 약간만
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: svgWidget,
                    ),
                  ),
                SizedBox(height: 4), // SVG와 날짜 사이 공간 확보 (기존 2에서 4로)
                Text(
                  '$dayNumber',
                  style: TextStyle(
                    fontSize: 12, // 날짜 글자 크기 약간 키움
                    fontWeight: FontWeight.w500,
                    color: isCurrentMonth ? Colors.black : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 6주로 나누어 표시
    List<Widget> weeks = [];
    for (int i = 0; i < 6; i++) {
      weeks.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: calendarDays.sublist(i * 7, (i + 1) * 7),
        ),
      );
      if (i < 5) weeks.add(SizedBox(height: 8));
    }

    return Column(children: weeks);
  }

  String _getWeekdayName(int weekday) {
    const weekdays = ['', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
    return weekdays[weekday];
  }

  Widget _buildScheduleItem(String title, String type, String instructor, String duration, String key) {
    bool isChecked = scheduleCheckStates[key] ?? false;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                scheduleCheckStates[key] = !isChecked;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isChecked ? Color(0xFF43D4D2) : Colors.white,
                border: Border.all(
                  color: isChecked ? Color(0xFF43D4D2) : Colors.grey[400]!,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: isChecked ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "$type | $instructor | $duration",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}