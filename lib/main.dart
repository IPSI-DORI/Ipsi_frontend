import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'app.dart';
import 'features/chatbot/viewmodels/chat_view_model.dart';
import 'features/curriculum/viewmodels/curriculum_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: 'a19586ddd9ab7a34283d45abe1022db1'); // ✅ Kakao SDK 초기화

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
