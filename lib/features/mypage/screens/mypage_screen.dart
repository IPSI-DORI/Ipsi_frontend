import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '여기에 마이페이지 내용이 표시됩니다.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
