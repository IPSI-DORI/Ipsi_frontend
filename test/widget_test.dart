import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipsi_frontend/app.dart'; // 또는 MyApp이 선언된 경로

void main() {
  testWidgets('앱이 정상적으로 렌더링된다', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // 실제 렌더링되는 텍스트로 수정!
    expect(find.text('입시도리'), findsOneWidget);
  });
}
