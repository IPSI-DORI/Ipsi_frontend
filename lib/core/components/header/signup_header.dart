import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';

class SignupHeader extends StatelessWidget {
  // 속성 정의
  final int currentStep; // 현재 몇 번째인지

  // 생성자 정의
  SignupHeader({
    super.key,
    required this.currentStep,
  });

  // ui
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingL),
        child: Stack(alignment: Alignment.center, children: [
          // 단계를 표현하는 동그라미들
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: AppSizes.padding3XS),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentStep == index
                      ? AppColors.primary
                      : AppColors.gray100,
                ),
              );
            }),
          ),

          // 이전 버튼
          Align(
              alignment: Alignment.centerLeft,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon/back.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                )
              ])),
        ]));
  }
}
