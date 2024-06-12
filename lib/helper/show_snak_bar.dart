

import 'package:flutter/material.dart';

 
void showSnakBar(BuildContext context, String massege,{Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massege),
        backgroundColor: color,
      ),

    );
  }