import 'package:flutter/material.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/constants/fonts/font_const.dart';

class AppTheme {
  // APP THEME ONLY LIGHT MODE
  static get apptheme => ThemeData(
    textTheme: const TextTheme(
      headline3: TextStyle(color: ColorConst.white),
      headline4: TextStyle(color: ColorConst.black),
      headline5: TextStyle(color: ColorConst.white),
      headline6: TextStyle(color: ColorConst.black, fontWeight: FWconst.bold),
    ),
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: ColorConst.kPrimaryColor,
      brightness: Brightness.light
    ),
  );
}