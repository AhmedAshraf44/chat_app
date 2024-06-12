
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key, 
    required this.message
  });
 
  final Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 35,
              top: 35,
              right: 35,
            ),
            child: Text(
              message.messageText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key, 
    required this.message,
  });
 
  final Messages message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 35,
              top: 35,
              right: 35,
            ),
            child: Text(
              message.messageText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
