import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';

// 커스텀 인풋
class TextIconField extends StatelessWidget {
  // 속성 정의
  final String title;
  final VoidCallback? oncClick;

  // 생성자 정의
  const TextIconField(
      {super.key, // 상위 클래스에 전달
      required this.title,
      required this.oncClick});

  // ui
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.padding3XS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(title,
                  style: appTextTheme.bodyLarge
                      ?.copyWith(color: AppColors.gray800)),
              // 여백 자동 확보
              const Spacer(),

              // > 아이콘
              GestureDetector(
                onTap: oncClick,
                child: Image.asset(
                  'assets/images/icon/gray300_next.png',
                  height: 24,
                ),
              )
            ])
          ],
        ));
  }
}
