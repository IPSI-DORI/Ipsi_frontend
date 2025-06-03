import 'package:flutter/material.dart';

class LectureDetailModal extends StatefulWidget {
  final Map<String, dynamic> lectureData;
  final VoidCallback? onNext;
  final VoidCallback? onRestart;

  const LectureDetailModal({
    Key? key,
    required this.lectureData,
    this.onNext,
    this.onRestart,
  }) : super(key: key);

  @override
  _LectureDetailModalState createState() => _LectureDetailModalState();
}

class _LectureDetailModalState extends State<LectureDetailModal> {
  int? selectedLectureIndex; // 선택된 강의 인덱스

  // 강의 목록 데이터
  final List<Map<String, String>> lectures = [
    {'title': '오리엔테이션', 'duration': '3:25'},
    {'title': '01강. 실전모의고사 1회', 'duration': '66:10'},
    {'title': '02강. 실전모의고사 2회', 'duration': '67:23'},
    {'title': '03강. 실전모의고사 3회', 'duration': '67:03'},
    {'title': '04강. 실전모의고사 4회', 'duration': '65:08'},
    {'title': '05강. 실전모의고사 5회', 'duration': '72:13'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // 상단 핸들
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // 스크롤 가능한 내용
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildSection('강의 범위', '2026학년도 대학수학능력시험범위 미적분'),
                  const SizedBox(height: 24),
                  _buildSection('강의 특징', '• 실전 모의고사 연습으로 실전능력을 극대화'),
                  const SizedBox(height: 24),
                  _buildSection('수강 대상', '2026 수능으로 미적분을 선택한 학생'),
                  const SizedBox(height: 24),
                  _buildSection('교재명', 'EBS 2025학년도 수능완성 수학영역 수학I/수학2/미적분'),
                  const SizedBox(height: 24),
                  _buildSection('교재비', 'NN,000원'),
                  const SizedBox(height: 24),
                  _buildCurriculumSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // 하단 버튼 영역
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[2025 수능완성] 수학+미적분 - 남치영 미적분 (실전편)',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('무료', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(width: 8),
            const Text('남치영', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 8),
            const Text('65분(5강)', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(content),
      ],
    );
  }

  Widget _buildCurriculumSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '강의구성',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: List.generate(
              lectures.length,
              (index) => _buildLectureItem(
                lectures[index]['title']!,
                lectures[index]['duration']!,
                index,
                isLast: index == lectures.length - 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLectureItem(String title, String duration, int index, {bool isLast = false}) {
    bool isSelected = selectedLectureIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedLectureIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          border: isLast ? null : Border(
            bottom: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.blue : Colors.black,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.blue : Colors.grey[600],
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 20,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (selectedLectureIndex != null) {
              Navigator.of(context).pop();
              widget.onNext?.call();
            } else {
              Navigator.of(context).pop();
              widget.onRestart?.call();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedLectureIndex != null ? Colors.blue : Colors.grey,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            selectedLectureIndex != null ? '다음' : '다시 만들래요',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}