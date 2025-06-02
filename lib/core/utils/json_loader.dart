import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<Map<String, List<String>>> loadUniversityMajorMap() async {
  final String jsonString = await rootBundle.loadString('assets/json/university.json');
  final Map<String, dynamic> jsonData = json.decode(jsonString);

  final List records = jsonData['records'];

  // school -> major map
  final Map<String, Set<String>> universityMap = {};

  for (final record in records) {
    final schoolName = record['학교명'];
    final majorName = record['학과명'];

    if (schoolName != null && majorName != null) {
      universityMap.putIfAbsent(schoolName, () => <String>{}).add(majorName);
    }
  }

  // List로 변환
  return universityMap.map((key, value) => MapEntry(key, value.toList()));
}
