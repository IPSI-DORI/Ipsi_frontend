import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import '../../../core/ui/components/text/noticeContent.dart';
import '../../../core/ui/components/header/back_title_header.dart';

class Noticescreen extends StatefulWidget {
  const Noticescreen({super.key});

  @override
  State<Noticescreen> createState() => _NoticescreenState();
}

class _NoticescreenState extends State<Noticescreen> {
  List<Map<String, dynamic>> notices = [
    {
      'title': '[안내] 입시도리 앱 출시',
      'date': '2025.08.01',
      'content': '안녕하세요! 맞춤형 AI 입시도우미 도리가 출시되었어요. 잘 부탁드려요.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackTitleHeader(title: "공지사항"),
          Expanded(
            child: ListView.builder(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final item = notices[index];
                return NoticeContent(
                  title: item['title'],
                  date: item['date'],
                  content: item['content'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
