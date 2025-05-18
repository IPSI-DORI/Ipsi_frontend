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
                      itemCount: 4, // 1: 과목, 2: 공부 시간/요일, 3: 모의고사/수능 성적, 4: 설문조사
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: viewModel.setCurrentPage,
                      itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildSubjectPage(context, 0, viewModel);
                      } else if (index == 1) {
                        return _buildTimeAndDayPage(context, viewModel);
                      } else if (index == 2) {
                        return _buildExamScoresPage(context, viewModel);
                      } else if (index == 3) {
                        // TODO: 학습 관련 설문조사 페이지 위젯 구현 필요
                        return _buildSurveyPage(context, viewModel);
                      } else {
                        return const SizedBox.shrink();
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
    String headerText;
    switch (viewModel.currentPage) {
      case 0:
      headerText = '커리큘럼 과목을 알려주세요';
      break;
      case 1:
      headerText = '커리큘럼 공부 시간과 요일을 정해주세요';
      break;
      case 2:
      headerText = '최근 모의고사 성적을 입력해주세요';
      break;
      case 3:
      headerText = '간단한 설문조사에 응답해주세요';
      break;
      default:
      headerText = '';
    }
    
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

  // 시험 종류 목록 (예시)
  final List<String> _examTypes = [
    '수능',
    '6월 평가원 모의고사',
    '9월 평가원 모의고사',
    '학교 내신',
  ];

  // 성적 입력 항목
  final List<String> _scoreFields = ['원점수', '등급', '백분위'];

  Widget _buildExamScoresPage(BuildContext context, CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "시험 종류",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              context,
              0,
              _examTypes,
              viewModel.selectedExamType.isNotEmpty ? viewModel.selectedExamType.first : '',
              (value) => viewModel.setExamType(value),
              '시험 종류를 선택해주세요',
            ),
            const SizedBox(height: 24),
            const Text(
              "성적 입력",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ..._scoreFields.map((field) => _buildScoreInputField(
              field,
              viewModel.getExamScore(field),
              (value) => viewModel.setExamScore(field, value),
            )),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.teal.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '현재 성적을 입력하시면 목표 달성을 위한 맞춤형 커리큘럼을 제공해 드립니다.',
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // 설문조사 질문 목록 (예시)
    final List<Map<String, dynamic>> _surveyQuestions = [
      {
        'question': '가장 선호하는 학습 방식은?',
        'options': ['선생님의 설명을 자세히 듣고 필기하며 이해하는 방식', 
        '다양한 문제 풀이를 통해 개념을 적용하고 실력을 키우는 방식', 
        '핵심 내용을 간결하게 요약하여 빠르게 학습하는 방식', 
        '시각 자료(그래프, 그림 등)를 통해 직관적으로 이해하는 방식'],
      },
      {
        'question': '인터넷 강의를 들을 때 가장 중요한 요소는?',
        'options': ['선생님의 명확하고 이해하기 쉬운 설명', 
        '풍부하고 다양한 문제 풀이 제공', 
        '체계적인 커리큘럼과 학습 자료', 
        '높은 학습 동기 부여 및 재미'],
      },
      {
        'question': '현재 학습 목표는?',
        'options': ['기본 개념을 확실하게 다지는 것', 
        '심화된 내용까지 깊이 있게 학습하는 것', 
        '특정 유형의 문제 풀이 능력을 향상시키는 것', 
        '실전 감각을 키우고 시간 관리 능력을 향상시키는 것'],
      },
      {
        'question' : '원하는 난이도는?',
        'options' : [
          '기초 개념을 쉽고 자세하게 설명하는 강의',
          '기본 개념을 바탕으로 심화 내용을 다루는 강의',
          '고난도 문제 풀이 전략을 제시하는 강의',
          '실력 점검을 위한 다양한 난이도와 문제를 제공하는 강의'
        ]
      }
    ];
  
    Widget _buildSurveyPage(BuildContext context, CurriculumViewModel viewModel) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._surveyQuestions.map((questionData) {
                final String question = questionData['question'];
                final List<String> options = questionData['options'].cast<String>();
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildDropdown(
                      context,
                      0,
                      options,
                      viewModel.getSurveyAnswer(question),
                      (value) => viewModel.setSurveyAnswer(question, value),
                      '한 가지를 선택해주세요',
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }).toList(),
              const Text(
                "추가 요청사항 (선택)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                    hintText: '선생님께 전달할 추가 요청사항이 있으면 작성해주세요',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  onChanged: (value) => viewModel.setAdditionalRequest(value),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

  Widget _buildScoreInputField(String subject, String value, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              subject,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                  hintText: '백분위 또는 등급',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                controller: TextEditingController(text: value),
                onChanged: onChanged,
              ),
            ),
          ),
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
          onTap: () {
            viewModel.toggleDay(day);
            setState(() {}); // 선택 상태 변경 시 UI 갱신
          },
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
