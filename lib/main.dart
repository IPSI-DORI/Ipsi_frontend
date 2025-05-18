import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'features/chatbot/viewmodels/chat_view_model.dart';
import 'features/curriculum/viewmodels/curriculum_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
        ChangeNotifierProvider(create: (_) => CurriculumViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}
