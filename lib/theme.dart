import 'package:flutter/material.dart';

// this is as cool as --var-color in css.. you define the colors you will use here and then you just call them
//by App.Colors. the color you want
class AppColors {
  static Color primaryColor = const Color.fromARGB(255, 189, 34, 23);
  static Color primaryAccent = const Color.fromRGBO(120, 14, 14, 1);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromRGBO(150, 150, 150, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

//themeData is a pre-defined class.. we just created our new ThemeData
ThemeData primaryTheme = ThemeData(
  //seed color ? you just pass one color and flutter will take care of the variants
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  //scaffold
  scaffoldBackgroundColor: AppColors.secondaryAccent,
//appBar theme
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.textColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true),
  // text theme.. we use copy with so we can keep the un-edited stuff unmodified
  textTheme: const TextTheme().copyWith(
    bodyMedium:
        TextStyle(color: AppColors.textColor, fontSize: 16, letterSpacing: 1),
    headlineMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: AppColors.titleColor,
        fontSize: 18,
        letterSpacing: 2,
        fontWeight: FontWeight.bold),
  ),
  cardTheme: const CardTheme().copyWith(
    color: AppColors.secondaryColor.withOpacity(0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondaryColor.withOpacity(0.6),
      border: InputBorder.none,
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.textColor),
  // idid this on my own.. yay
  dialogTheme:const DialogTheme().copyWith(
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor:Colors.transparent,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.secondaryColor,
    showCloseIcon: true,
    
  )
);
