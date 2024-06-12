import 'package:chat_app/constants.dart';

class Messages
{
  final String messageText;
  final String id;


  Messages({required this.id, required this.messageText});

  factory Messages.fromJson(jsonData)
  {
    return Messages(messageText: jsonData[kMessage],id: jsonData[kId]);
  }
}