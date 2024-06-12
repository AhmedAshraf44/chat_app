
// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable
import 'package:flutter/material.dart';


class CustomTextFeild extends StatelessWidget {
CustomTextFeild({super.key, this.hintText,this.onChanged,});
 

  String? hintText;
  Function(String)? onChanged;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty )
        {
        return 'Feild a Required';
        }
  //     else if (EmailValidator.validate(email)) {
  //   return 'Invalid email';
  // }
      },
      onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:const TextStyle(color: Colors.white),
              labelStyle:const TextStyle(
              color: Colors.white,
               ),
               enabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
               ),
              border:const OutlineInputBorder(
                 borderSide:BorderSide(
                  color: Colors.white),
              ),
            ),
            );
  }
}