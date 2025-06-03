import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'DonutChartPaint.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';

class DonutChart extends StatelessWidget {
  final double progress;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final Widget? child;

  const DonutChart({
    Key? key,
    required this.progress,
    this.size = 60.0,
    this.progressColor = AppColors.primary,
    this.backgroundColor = AppColors.gray200,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: DonutChartPainter(
              progress: progress,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}