import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_view_model.dart';
import '../models/message_model.dart';
import 'package:intl/intl.dart';
import '../../../core/widgets/message_bubble.dart';
import '../../../core/widgets/option_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '채팅',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) {
          _scrollToBottom();
          return Column(
            children: [
              // 챗봇 정보 헤더
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.teal[100],
                      radius: 16,
                      child: const Icon(Icons.chat, color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '채팅봇',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              // 메시지 목록
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  itemCount: viewModel.messages.length,
                  itemBuilder: (context, index) {
                    final message = viewModel.messages[index];
                    final isBot = message.type == MessageType.bot;
                    final hasOptions = message.options != null && message.options!.isNotEmpty;
                    //final timeString = DateFormat('a h:mm').format(message.timestamp);

                    // 옵션이 있는 봇 메시지라면, 말풍선 안에 옵션 버튼을 포함
                    if (isBot && hasOptions) {
                      final timeString = DateFormat('a h:mm').format(message.timestamp);
                      return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 2, bottom: 4),
                        ),
                        Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bot 프로필 이미지
                          Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 4),
                          child: CircleAvatar(
                            backgroundImage: const AssetImage("assets/images/icon/bot_avatar.png"),
                            backgroundColor: Colors.teal[100],
                            radius: 16,
                          ),
                          ),
                          // 메시지 + 옵션
                          Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(
                              decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              margin: const EdgeInsets.only(bottom: 4, top: 0),
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                message.text,
                                style: const TextStyle(fontSize: 15, color: Colors.black87),
                                ),
                                const SizedBox(height: 10),
                                ...message.options!.map((option) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: OptionButton(
                                    text: option,
                                    onTap: () => viewModel.selectOption(option),
                                  ),
                                  )),
                              ],
                              ),
                            ),
                            // 시간 표시를 오른쪽 아래로 이동
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4, top: 0, bottom: 8),
                                child: Text(
                                timeString,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10,
                                ),
                                ),
                              ),
                              ],
                            ),
                            ],
                          ),
                          ),
                        ],
                        ),
                      ],
                      );
                    }

                    // 일반 메시지(유저/옵션 없는 봇)
                    return Column(
                      crossAxisAlignment: message.type == MessageType.user
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        MessageBubble(message: message),
                        Padding(
                          padding: EdgeInsets.only(
                            left: message.type == MessageType.user ? 0 : 8.0,
                            right: message.type == MessageType.user ? 8.0 : 0,
                            top: 2,
                            bottom: 8,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              
              // 타이핑 표시
              if (viewModel.isTyping)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16, bottom: 8),
                  child: const Text(
                    '입력 중...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              
              // 메시지 입력 영역
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.teal),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: '메시지를 입력해주세요',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.send,
                        onSubmitted: (text) {
                          if (text.trim().isNotEmpty) {
                            viewModel.sendMessage(text.trim());
                            _textController.clear();
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.teal),
                      onPressed: () {
                        final text = _textController.text.trim();
                        if (text.isNotEmpty) {
                          viewModel.sendMessage(text);
                          _textController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
