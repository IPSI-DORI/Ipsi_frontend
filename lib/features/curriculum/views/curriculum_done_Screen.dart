import 'package:flutter/material.dart';
import 'package:ipsi_frontend/core/components/app_button.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import 'package:ipsi_frontend/core/constants/app_sizes.dart';
import 'package:ipsi_frontend/core/theme/text_theme.dart';
import '../../todolist/views/todolist_screen.dart';

class CurriculumDone extends StatelessWidget {
  const CurriculumDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingL, vertical: AppSizes.paddingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/icon/done_morrie.png',
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 32),
                  Text("커리큘럼이 생성되었어요!", style: appTextTheme.titleLarge)
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodolistScreen(),
                      ),
                    );
                  },
                  size: AppButtonSize.large,
                  text: '투두리스트 확인하기',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
