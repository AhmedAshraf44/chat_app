// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  static String id = 'register';
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            isLoading = false;
            BlocProvider.of<ChatCubit>(context).getMessage();
            Navigator.pushNamed(context, ChatPage.id, arguments: email);
            showSnakBar(context, 'Success', color: Colors.red);
          } else if (state is RegisterFailure) {
            isLoading = false;
            showSnakBar(context, state.errMessage, color: Colors.red);
          }
        },
        builder: (context, state) => ModalProgressHUD(
              // inAsyncCall: Provider.of<ProviderIsLoding>(context).isLoading,
              inAsyncCall: isLoading,
              child: Scaffold(
                backgroundColor: kPrimaryColor,
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: formkey,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Image.asset(
                          kLogo,
                          height: 100,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Scholar Chat',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 65,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFeild(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFeild(
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          ontap: () async {
                            if (formkey.currentState!.validate()) {
                              // if i was , will use provider  .
                              // Provider.of<ProviderIsLoding>(context,listen: false).isLoading=true;
                              // BlocProvider.of<AuthCubit>(context)
                              //     .rigesterUser(email: email!, password: password!);
                              BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    email: email!, password: password!),
                              );
                            }

                            //  Provider.of<ProviderIsLoding>(context,listen:false).isLoading = false;
                          },
                          textButton: 'Register',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'already have an acount ?',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Login In',
                                style: TextStyle(
                                  color: Color(0xffC7EDE6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 65,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
