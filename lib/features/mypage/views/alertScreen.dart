import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import '../../../core/ui/components/CustomSwitch.dart';
import '../../../core/ui/components/header/back_title_header.dart';

class Alertscreen extends StatefulWidget {
  const Alertscreen({super.key});

  @override
  State<Alertscreen> createState() => _AlertscreenState();
}

class _AlertscreenState extends State<Alertscreen> {
  // 입시도리에서 보내는 소식
  bool isCheckedInfo = false;
  bool isCheckedMarketing = false;
  bool isCheckedMessage = false;
  bool isCheckedEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          BackTitleHeader(title: "알림 설정"),

          // 내용
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingL, vertical: AppSizes.paddingS),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("입시도리에서 보내는 소식", style: appTextTheme.bodyLarge),
                      Spacer(),
                      CustomSwitch(
                          value: isCheckedInfo,
                          onChanged: (value) {
                            setState(() {
                              isCheckedInfo = value;
                            });
                          }),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("마케팅 수신 동의", style: appTextTheme.bodyLarge),
                      Spacer(),
                      CustomSwitch(
                          value: isCheckedMarketing,
                          onChanged: (value) {
                            setState(() {
                              isCheckedMarketing = value;
                            });
                          }),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("마케팅 문자 수신 동의", style: appTextTheme.bodyLarge),
                      Spacer(),
                      CustomSwitch(
                          value: isCheckedMessage,
                          onChanged: (value) {
                            setState(() {
                              isCheckedMessage = value;
                            });
                          }),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("마케팅 이메일 수신 동의", style: appTextTheme.bodyLarge),
                      Spacer(),
                      CustomSwitch(
                          value: isCheckedEmail,
                          onChanged: (value) {
                            setState(() {
                              isCheckedEmail = value;
                            });
                          }),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
