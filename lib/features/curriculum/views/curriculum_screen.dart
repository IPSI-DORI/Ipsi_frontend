import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/curriculum_view_model.dart';

class CurriculumScreen extends StatefulWidget {
  const CurriculumScreen({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<CurriculumScreen> {
  final PageController _pageController = PageController();
  
  // 각 페이지별 선택 가능한 과목 목록 (예시)
  final List<Map<String, List<String>>> _subjectOptions = [
    {
      '수학': ['미적분', '통계', '기하'],
      '과학': ['물리', '화학', '생물'],
      '영어': ['독해', '문법', '회화'],
    },
    {
      '역사': ['한국사', '세계사', '동양사'],
      '사회': ['경제', '정치', '지리'],
      '음악': ['클래식', '재즈', '현대음악'],
    },
    {
      '국어': ['문학', '문법', '작문'],
      '체육': ['축구', '농구', '수영'],
      '미술': ['드로잉', '페인팅', '조소'],
    },
    {
      '컴퓨터': ['프로그래밍', '웹개발', '데이터과학'],
      '제2외국어': ['중국어', '일본어', '프랑스어'],
      '철학': ['서양철학', '동양철학', '윤리학'],
    },
  ];
  
  // 시간대 목록 (예시)
  final List<String> _timeSlots = [
    '오전 9시-10시',
    '오전 10시-11시',
    '오전 11시-12시',
    '오후 1시-2시',
    '오후 2시-3시',
    '오후 3시-4시',
    '오후 4시-5시',
    '오후 5시-6시',
  ];
  
  // 요일 목록
  final List<String> _days = ['월', '화', '수', '목', '금', '토', '일'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurriculumViewModel(),
      child: Consumer<CurriculumViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  _buildHeader(viewModel),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5, // 과목 선택 4페이지 + 시간/요일 선택 1페이지
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: viewModel.setCurrentPage,
                      itemBuilder: (context, index) {
                        if (index < 4) {
                          return _buildSubjectPage(context, index, viewModel);
                        } else {
                          return _buildTimeAndDayPage(context, viewModel);
                        }
                      },
                    ),
                  ),
                  _buildNextButton(viewModel),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(CurriculumViewModel viewModel) {
    final String headerText = viewModel.currentPage < 4 
        ? '커리큘럼 과목을 알려주세요'
        : '커리큘럼 공부 시간과 요일을 정해주세요';
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (viewModel.currentPage > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == viewModel.currentPage
                          ? Colors.teal
                          : Colors.grey.shade300,
                    ),
                  );
                }),
              ),
              const Spacer(),
              const SizedBox(width: 48), // 뒤로가기 버튼과 균형을 맞추기 위한 여백
            ],
          ),
        ),
        Text(
          headerText,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSubjectPage(BuildContext context, int pageIndex, CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "과목",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            context,
            pageIndex,
            _subjectOptions[pageIndex].keys.toList(),
            viewModel.selectedSubjects[pageIndex],
            (value) {
              viewModel.setSubject(pageIndex, value);
              // 과목이 변경되면 세부 과목 초기화
              viewModel.setDetailSubject(pageIndex, '');
            },
            '원하시는 과목을 선택해주세요',
          ),
          const SizedBox(height: 24),
          const Text(
            "선택과목",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            context,
            pageIndex,
            viewModel.selectedSubjects[pageIndex].isEmpty
                ? []
                : _subjectOptions[pageIndex][viewModel.selectedSubjects[pageIndex]] ?? [],
            viewModel.selectedDetailSubjects[pageIndex],
            (value) => viewModel.setDetailSubject(pageIndex, value),
            '원하시는 선택과목을 선택해주세요',
          ),
        ],
      ),
    );
  }

  Widget _buildTimeAndDayPage(BuildContext context, CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "예상되는 하루 공부 시간은?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            context,
            4,
            _timeSlots,
            viewModel.selectedTimeSlot,
            (value) => viewModel.setTimeSlot(value),
            '시간대를 선택해주세요',
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                "예상되는 공부 요일은?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "(중복 가능)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.teal.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDaySelector(viewModel),
        ],
      ),
    );
  }

  Widget _buildDaySelector(CurriculumViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _days.map((day) {
        final bool isSelected = viewModel.selectedDays.contains(day);
        return InkWell(
          onTap: () => viewModel.toggleDay(day),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey.shade300,
              ),
              color: isSelected ? Colors.teal : Colors.transparent,
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    int pageIndex,
    List<String> items,
    String selectedValue,
    Function(String) onChanged,
    String hint,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue.isEmpty ? null : selectedValue,
          hint: Text(hint),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildNextButton(CurriculumViewModel viewModel) {
    final bool canProceed = viewModel.canProceed(viewModel.currentPage);
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: canProceed ? Colors.teal : Colors.grey.shade200,
            foregroundColor: canProceed ? Colors.white : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: canProceed
              ? () {
                  if (viewModel.currentPage < 4) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // 모든 페이지 완료 후 다음 단계로 이동
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (_) => NextScreen()),
                    // );
                  }
                }
              : null,
          child: const Text('다음'),
        ),
      ),
    );
  }
}
