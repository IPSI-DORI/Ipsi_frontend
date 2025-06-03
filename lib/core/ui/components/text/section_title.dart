import 'package:flutter/cupertino.dart';
import '../../../theme/text_theme.dart';

// 회원가입과 커리큘럼 생성 시 쓰이는 커스텀 타이틀
class SectionTitle extends StatelessWidget {
  // 속성 정의
  final String title;
  final String subPrimaryTitle;
  final String subTitle;
  final bool reverseOrder;

  // 생성자 정의
  const SectionTitle(
      {super.key,
      this.title = '',
      required this.subTitle,
      required this.subPrimaryTitle,
      this.reverseOrder = true});

  // ui
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: appTextTheme.titleLarge),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: reverseOrder
                  ? [
                      Text(subPrimaryTitle, style: primaryTitleLarge),
                      Text(subTitle, style: appTextTheme.titleLarge),
                    ]
                  : [
                      Text(subTitle, style: appTextTheme.titleLarge),
                      Text(subPrimaryTitle, style: primaryTitleLarge),
                    ]),
        ]));
  }
}
