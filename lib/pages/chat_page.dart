// ignore_for_file: must_be_immutable

import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'HomePage';
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  
  String? data;
 

  @override
  Widget build(BuildContext context) {
    String email =ModalRoute.of(context)!.settings.arguments as String;
        // List<Messages> messageList = [];
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(kLogo, height: 50),
                    const Text('Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    // child: BlocConsumer<ChatCubit,ChatState>(
                    //   listener: (context, state) {
                    //     if (state is ChatSuccess)
                    //     {
                    //     messageList = state.messages;
                    //     }
                    //   },
                    child: BlocBuilder<ChatCubit,ChatState>( 
                      builder: (context, state) { 
                        var  messageList = BlocProvider.of<ChatCubit>(context).messageList;
                        return ListView.builder(
                        reverse: true,
                        controller: _controller,
                       // keyboardDismissBehavior:
                          //  ScrollViewKeyboardDismissBehavior.onDrag,
                        physics:const BouncingScrollPhysics(),
                        itemCount: messageList.length,
                        itemBuilder:(context, index) {
                         return  messageList[index].id == email ? ChatBubble(message: messageList[index],) :
                         ChatBubbleForFriend(message: messageList[index]);
                        },
                      ); }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        data = value ;
                      },
                      onSubmitted: (data) {
                        BlocProvider.of<ChatCubit>(context).sendMessage(email: email, data: data);
                        controller.clear();
                        _controller.animateTo(
                           0,
                            duration:const Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn);
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<ChatCubit>(context).sendMessage(email: email, data: data!);
                              controller.clear();
                              _controller.animateTo(
                                 0,
                                  duration:const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            icon:const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:const BorderSide(
                                color: kPrimaryColor,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        //  else {
        //   return const ModalProgressHUD(
        //     color: Colors.grey,
        //     opacity: 0.5,
        //     inAsyncCall: true,
        //     child:Scaffold(
        //       backgroundColor: Colors.white,
        //     ),
        //   );
        // }
      }
  }

  // void _scrollDown() {
  //   _controller.animateTo(_controller.position.maxScrollExtent,
  //       duration:const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  // }
