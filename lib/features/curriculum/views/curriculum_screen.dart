import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/app_button.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import 'package:ipsi_frontend/features/curriculum/views/curriculum_creating_screen.dart';
import 'package:provider/provider.dart';
import 'package:ipsi_frontend/core/widgets/DountChart.dart';
import '../viewmodels/curriculum_view_model.dart';
import '../../../core/widgets/lecture_detail_modal.dart';

class CurriculumScreen extends StatefulWidget {
  final VoidCallback? onNext;
  final VoidCallback? onRestart;

  const CurriculumScreen({super.key, this.onNext, this.onRestart});

  @override
  State<CurriculumScreen> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<CurriculumScreen> {
  final PageController _pageController = PageController();

  // Dropdown builder for various dropdowns in the curriculum screen
  Widget _buildDropdown(
    BuildContext context,
    int pageIndex,
    List<String> items,
    String selectedValue,
    ValueChanged<String> onChanged,
    String hintText,
  ) {
    return DropdownButtonFormField<String>(
      value: selectedValue.isNotEmpty ? selectedValue : null,
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  // 강의 목록을 새로고침하는 함수 (예시 구현)
  void _regenerateLectures(
      BuildContext context, CurriculumViewModel viewModel) {
    setState(() {
      // 예시: 강의 목록을 무작위로 섞거나 새로 생성
      _lectureContent.shuffle(Random());
      viewModel.setSelectedLecture(-1); // 선택 초기화
    });
    Navigator.of(context).pop(); // 모달 닫기
  }

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

  // 시간대 목록
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

  // 시험 종류 목록 (예시)
  final List<String> _examTypes = [
    '수능',
    '6월 평가원 모의고사',
    '9월 평가원 모의고사',
    '학교 내신',
  ];

  // 성적 입력 항목
  final List<String> _scoreFields = ['원점수', '등급', '백분위'];

  // 등급 선택 옵션
  final List<String> _gradeOptions = [
    '1등급',
    '2등급',
    '3등급',
    '4등급',
    '5등급',
    '6등급',
    '7등급',
    '8등급',
    '9등급'
  ];

  // 설문조사 질문 목록
  final List<Map<String, dynamic>> _surveyQuestions = [
    {
      'question': '가장 선호하는 학습 방식은?',
      'options': [
        '선생님의 설명을 자세히 듣고 필기하며 이해하는 방식',
        '다양한 문제 풀이를 통해 개념을 적용하고 실력을 키우는 방식',
        '핵심 내용을 간결하게 요약하여 빠르게 학습하는 방식',
        '시각 자료(그래프, 그림 등)를 통해 직관적으로 이해하는 방식'
      ],
    },
    {
      'question': '인터넷 강의를 들을 때 가장 중요한 요소는?',
      'options': [
        '선생님의 명확하고 이해하기 쉬운 설명',
        '풍부하고 다양한 문제 풀이 제공',
        '체계적인 커리큘럼과 학습 자료',
        '높은 학습 동기 부여 및 재미'
      ],
    },
    {
      'question': '현재 학습 목표는?',
      'options': [
        '기본 개념을 확실하게 다지는 것',
        '심화된 내용까지 깊이 있게 학습하는 것',
        '특정 유형의 문제 풀이 능력을 향상시키는 것',
        '실전 감각을 키우고 시간 관리 능력을 향상시키는 것'
      ],
    },
    {
      'question': '원하는 난이도는?',
      'options': [
        '기초 개념을 쉽고 자세하게 설명하는 강의',
        '기본 개념을 바탕으로 심화 내용을 다루는 강의',
        '고난도 문제 풀이 전략을 제시하는 강의',
        '실력 점검을 위한 다양한 난이도와 문제를 제공하는 강의'
      ]
    }
  ];

  // 강의 목록 (mutable로 변경)
  List<Map<String, dynamic>> _lectureContent = [
    {
      'title': '[2025 수능완성] 수학 + 미적분 - 남치열 미적분(실전편)',
      'price': '무료',
      'name': '남치열',
      'time': '65분(5강)',
      'progress': 0.8,
    },
    {
      'title': '2026 현우진의 드릴 - 미적분(선택)',
      'price': '유료',
      'name': '현우진',
      'time': '60분(10강)',
      'progress': 0.5,  
    },
    {
      'title': '[미적분] 2026 김기현의 Connection',
      'price': '유료',
      'name': '김기현',
      'time': '60분(19강)',
      'progress': 0.3,
    }
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurriculumViewModel>(
      create: (_) => CurriculumViewModel(),
      child: Consumer<CurriculumViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(viewModel),
                Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 5,
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
                    return _buildSurveyPage(context, viewModel);
                  } else if (index == 4) {
                    return _buildLecturePage(context, viewModel);
                  } else {
                    return const SizedBox.shrink();
                  }
                  },
                ),
                ),
                viewModel.currentPage < 4
                  ? _buildNextButton(viewModel)
                  : _buildLastButton(viewModel),
              ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(CurriculumViewModel viewModel) {
    TextSpan headerSpan;

    switch (viewModel.currentPage) {
      case 0:
        headerSpan = const TextSpan(
          children: [
            TextSpan(text: '커리큘럼 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '과목', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '을 알려주세요', style: TextStyle(color: Colors.black)),
          ],
        );
        break;
      case 1:
        headerSpan = const TextSpan(
          children: [
            TextSpan(text: '커리큘럼 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '공부 시간', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '과 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '요일', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '을 정해주세요', style: TextStyle(color: Colors.black)),
          ],
        );
        break;
      case 2:
        headerSpan = const TextSpan(
          children: [
            TextSpan(text: '최근 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '모의고사/수능 성적', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '을 입력해주세요', style: TextStyle(color: Colors.black)),
          ],
        );
        break;
      case 3:
        headerSpan = const TextSpan(
          children: [
            TextSpan(text: '학습 관련 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '설문조사', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '에 참여해주세요', style: TextStyle(color: Colors.black)),
          ],
        );
        break;
      case 4:
        headerSpan = const TextSpan(
          children: [
            TextSpan(text: '듣고싶은 ', style: TextStyle(color: Colors.black)),
            TextSpan(text: '맞춤 강의', style: TextStyle(color: AppColors.primary)),
            TextSpan(text: '를 선택해주세요', style: TextStyle(color: Colors.black)),
          ],
        );
        break;
      default:
        headerSpan = const TextSpan(text: '');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                            ? AppColors.primary
                            : AppColors.gray100,
                      ),
                    );
                  })),
              const Spacer(),
              const SizedBox(width: 48), // 뒤로가기 버튼과 균형을 맞추기 위한 여백
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // 글자 크게
              children: headerSpan.children,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSubjectPage(
      BuildContext context, int pageIndex, CurriculumViewModel viewModel) {
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
          : _subjectOptions[pageIndex]
            [viewModel.selectedSubjects[pageIndex]] ??
              [],
            viewModel.selectedDetailSubjects[pageIndex],
            (value) => viewModel.setDetailSubject(pageIndex, value),
            '원하시는 선택과목을 선택해주세요',
          ),
        ],
      ),
    );
  }

  Widget _buildTimeAndDayPage(
      BuildContext context, CurriculumViewModel viewModel) {
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
                  color: AppColors.primary,
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

  Widget _buildExamScoresPage(
      BuildContext context, CurriculumViewModel viewModel) {
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
              viewModel.selectedExamType.isNotEmpty
                  ? viewModel.selectedExamType.first
                  : '',
              (value) => viewModel.setExamType(value),
              '시험 종류를 선택해주세요',
            ),
            // 여기에 성적 입력 필드 등 추가
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyPage(BuildContext context, CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._surveyQuestions.map((questionData) {
              final String question = questionData['question'];
              final List<String> options =
                  questionData['options'].cast<String>();

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
                  DropdownButtonFormField<String>(
                    value: viewModel.getSurveyAnswer(question).isNotEmpty
                        ? viewModel.getSurveyAnswer(question)
                        : null,
                    items: options
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text(
                                  item,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        viewModel.setSurveyAnswer(question, value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '한 가지를 선택해주세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    // dropdownMaxHeight: 200, // Flutter 3.16+ only
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }).toList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLecturePage(
      BuildContext context, CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ..._lectureContent.asMap().entries.map((entry) {
              final int idx = entry.key;
              final lectureData = entry.value;
              final bool isSelected = viewModel.selectedLectureIndex == idx;
              return GestureDetector(
                onTap: () {
                  viewModel.setSelectedLecture(idx);
                  setState(() {}); // UI 갱신
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: isSelected
                        ? BorderSide(color: AppColors.primary, width: 1)
                        : BorderSide(color: AppColors.gray200, width: 1),
                  ),
                  color: isSelected ? AppColors.primary3 : AppColors.gray0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        // 제목과 X 버튼
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          DonutChart(
                            progress: lectureData['progress'] ?? 0.0,
                            size: 60.0, // 크기를 더 작게
                            progressColor: AppColors.primary,
                            backgroundColor: AppColors.gray300,
                            child: Text(
                            '${((lectureData['progress'] ?? 0.0) * 100).toInt()}%',
                            style: appTextTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12, // 폰트 크기 조정
                            ),
                            ),
                          ),
                          const SizedBox(height: 20),
                            Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(
                                lectureData['title'],
                                style: appTextTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                Text(lectureData['price']),
                                const SizedBox(width: AppSizes.padding3XS),
                                Text("|",
                                  style: appTextTheme.bodySmall
                                    ?.copyWith(color: AppColors.gray500)),
                                const SizedBox(width: AppSizes.padding3XS),
                                Text('${lectureData['name']}'),
                                const SizedBox(width: AppSizes.padding3XS),
                                Text("|",
                                  style: appTextTheme.bodySmall
                                    ?.copyWith(color: AppColors.gray500)),
                                const SizedBox(width: AppSizes.padding3XS),
                                Text('${lectureData['time']}'),
                                ],
                              ),
                              ],
                            ),
                            ),
                        const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                            setState(() {
                              _lectureContent.removeAt(idx);
                            });
                            // 선택된 인덱스 조정
                            if (viewModel.selectedLectureIndex! >= _lectureContent.length) {
                              viewModel.setSelectedLecture(_lectureContent.length - 1);
                            }
                            },
                            child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.gray500,
                            ),
                            ),
                          ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.padding3XS),
                        // 진행률과 상세보기 버튼을 가로로 배치
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          // 상세보기 버튼
                          SizedBox(
                            height: 48,
                            width: 300, // 버튼 너비를 줄임 (예: 64px)
                            child: AppButton(
                            onPressed: () {
                              showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => LectureDetailModal(
                                lectureData: lectureData,
                                onNext: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      CurriculumCreatingScreen()),
                                );
                                },
                                onRestart: () {
                                _regenerateLectures(context, viewModel);
                                },
                              ),
                              );
                            },
                            size: AppButtonSize.small, // 버튼 크기를 작게
                            style: AppButtonStyle.outlined,
                            text: '상세보기',
                            ),
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  // 요일 선택 위젯
  Widget _buildDaySelector(CurriculumViewModel viewModel) {
    return Wrap(
      spacing: 3.0,
      children: _days.map((day) {
        final bool isSelected = viewModel.selectedDays.contains(day);
        return InkWell(
          borderRadius: BorderRadius.circular(AppSizes.radius3XL),
          onTap: () {
            setState(() {
              if (isSelected) {
                viewModel.removeDay(day);
              } else {
                viewModel.addDay(day);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingM, vertical: AppSizes.paddingS),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.primary3 : AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: isSelected
                    ? Border.all(color: AppColors.primary, width: 1)
                    : Border.all(color: AppColors.gray200, width: 1)),
            child: Text(
              day,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.gray300,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNextButton(CurriculumViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: AppButton(
            onPressed: () {
              if (viewModel.currentPage < 4) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // 마지막 페이지에서의 동작 (예: 제출)
                Navigator.of(context).pop();
              }
            },
            size: AppButtonSize.large,
            text: '다음'),
      ),
    );
  }

  Widget _buildLastButton(CurriculumViewModel viewModel) {
    final bool hasSelection = viewModel.selectedLectureIndex != null;

    return Padding(
      padding: const EdgeInsets.all(AppSizes.radius2XL),
      child: SizedBox(
        width: double.infinity,
        child: AppButton(
          onPressed: () {
            if (hasSelection) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CurriculumCreatingScreen(),
                ),
              );
              widget.onNext?.call();
            } else {
              Navigator.of(context).pop();
              widget.onRestart?.call();
            }
          },
          size: AppButtonSize.large,
          style: hasSelection ? AppButtonStyle.filled : AppButtonStyle.outlined,
          text: hasSelection ? "다음" : '다시 만들래요',
        ),
      ),
    );
  }
}
