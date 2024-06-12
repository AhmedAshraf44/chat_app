import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
// ignore: must_be_immutable
final class ChatSuccess extends ChatState {

List <Messages> messages;
ChatSuccess({required this.messages});
}
