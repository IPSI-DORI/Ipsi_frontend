import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ChatViewModel with ChangeNotifier {
  List<Message> _messages = [];
  bool _isTyping = false;

  List<Message> get messages => _messages;
  bool get isTyping => _isTyping;

  ChatViewModel() {
    // 초기 봇 메시지 추가
    _addBotMessage(
      "반가워요! 저는 입시 컨설턴트 모리예요 😊\n전형, 대학, 성적 고민까지 궁금한 게 많으실 때 언제든 편하게 물어보세요.",
      [
        "2025년도 한양대학교 응용학과 정시 합격선은?",
        "추천 모의고사 문제집은?",
        "내신 2등급인데 서강대학교 합격 가능 성은?"
      ],
    );
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // 사용자 메시지 추가
    _messages.add(Message(
      text: text,
      type: MessageType.user,
      timestamp: DateTime.now(),
    ));
    
    notifyListeners();
    
    // 봇 응답 시뮬레이션
    _simulateBotTyping();
  }

  void _simulateBotTyping() {
    _isTyping = true;
    notifyListeners();
    
    // 실제 앱에서는 API 호출 등을 통해 응답을 받아야 함
    Future.delayed(const Duration(seconds: 1), () {
      _isTyping = false;
      
      // 예시 응답
      _addBotMessage(
        "죄송합니다만, 현재 2025년 입시 정보는 업데이트 중입니다. 최신 입시 정보는 한양대학교 입학처 홈페이지를 확인해 주세요.",
        ["다른 대학 정보가 궁금해요", "모의고사 문제집 추천해주세요"],
      );
    });
  }

  void _addBotMessage(String text, List<String>? options) {
    _messages.add(Message(
      text: text,
      type: MessageType.bot,
      timestamp: DateTime.now(),
      options: options,
      profileImage: "assets/images/bot_avatar.png",
    ));
    
    notifyListeners();
  }

  void selectOption(String option) {
    sendMessage(option);
  }
}