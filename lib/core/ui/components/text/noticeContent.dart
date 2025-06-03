import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import '../../../constants/app_colors.dart';

class NoticeContent extends StatefulWidget {
  final String title;
  final String date;
  final String content;

  const NoticeContent({
    super.key,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  State<NoticeContent> createState() => _NoticeContentState();
}

class _NoticeContentState extends State<NoticeContent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title, style: appTextTheme.bodyLarge),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.date,
              style: appTextTheme.bodySmall?.copyWith(color: AppColors.gray300),
            ),
          ),
          trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        if (isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingL, vertical: AppSizes.paddingS),
            child: Text(
              widget.content,
              style: const TextStyle(fontSize: 14, color: AppColors.gray800),
            ),
          ),
        const Divider(height: 1, color: AppColors.gray100),
      ],
    );
  }
}
