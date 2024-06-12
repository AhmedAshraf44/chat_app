
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

   CollectionReference message =
      FirebaseFirestore.instance.collection(kMessageCollection);

      List <Messages> messageList = [];
  sendMessage({required String email , required String data})
  {
      try {
  message.add({
      kMessage: data,
      kCreateAt: DateTime.now(),
      kId : email ,
      });

} on Exception catch (e) {
  print(e.toString());
}
  }


  getMessage()
  {
     message.orderBy(kCreateAt,descending:true ).snapshots().listen((event)
    {
      messageList.clear();
      for(var docs in event.docs)
      {
        messageList.add(Messages.fromJson(docs));
      }
      emit(ChatSuccess(messages: messageList));
    });

  }
}
