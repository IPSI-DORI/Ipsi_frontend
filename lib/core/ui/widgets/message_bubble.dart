import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ipsi_frontend/core/constants/app_colors.dart';
import '../../../features/chatbot/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeString = DateFormat('a h:mm').format(message.timestamp);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.type == MessageType.user
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (message.type == MessageType.bot && message.profileImage != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.teal[100],
                backgroundImage: AssetImage(message.profileImage!),
              ),
            ),
          if (message.type == MessageType.bot && message.profileImage == null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.teal[100],
                child: const Icon(Icons.chat, color: Colors.white, size: 16),
              ),
            ),
          Column(
            crossAxisAlignment: message.type == MessageType.user
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: message.type == MessageType.user
                      ? AppColors.primary
                      : AppColors.gray0,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: message.type == MessageType.user
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                timeString,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
