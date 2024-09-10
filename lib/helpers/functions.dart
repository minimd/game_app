import 'package:flutter/material.dart';
import 'package:game_app/theme.dart';

//damn.. i made this function to write go to instead of the whole navigator.push thing..
void goTo(context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => page));
}

void snacky(context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      showCloseIcon: true,
      closeIconColor: AppColors.textColor,
    ),
  );
}
