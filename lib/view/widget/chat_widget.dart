import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatWidget({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isMe ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
            bottomLeft: Radius.circular(isMe ? 12.0 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 12.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
