import 'package:flutter/material.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('커리큘럼'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          '여기에 커리큘럼 내용이 표시됩니다.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
