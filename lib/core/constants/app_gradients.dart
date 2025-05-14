import 'package:flutter/material.dart';

// 공통 그라데이션 컬러값
class AppGradients {
  
  // 위아래 그라데이션 스카이블루
  static const LinearGradient skyBlueVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFB2E5FF),
      Color(0xFF37BCFF)
    ]
  );

  // 위아래 그라데이션 오렌지
  static const LinearGradient orangeVertical = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFB37F),
        Color(0xFFFF7B0D)
      ]
  );
}