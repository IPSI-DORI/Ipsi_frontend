import 'package:flutter/material.dart';

enum MessageType { user, bot }

class Message {
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final List<String>? options;
  final String? profileImage;

  Message({
    required this.text,
    required this.type,
    required this.timestamp,
    this.options,
    this.profileImage,
  });
}