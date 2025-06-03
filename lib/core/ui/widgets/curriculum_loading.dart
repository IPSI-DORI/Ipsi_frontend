import 'package:flutter/material.dart';

class CurriculumLoading extends StatelessWidget {
  final double containerSize;
  final double progressSize;

  const CurriculumLoading({
    Key? key,
    required this.containerSize,
    this.progressSize = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      child: Center(
        child: SizedBox(
          height: progressSize,
          width: progressSize,
          //일단 이거 glf 받기 전까지는 원형 프로그래스로 나타낼 예정
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
