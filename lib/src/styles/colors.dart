import 'package:flutter/material.dart';

class AppColors {
  static const darkBlue = Color(0xff243B6B);

  static const lightColorSchema = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffffe6e6),
      onPrimary: darkBlue,
      secondary: darkBlue,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color(0xffFFEEEE),
      onBackground: darkBlue,
      surface: Colors.white,
      onSurface: darkBlue);
  static const darkColorSchema = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffe6e6),
      onPrimary: Colors.white,
      secondary: darkBlue,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color.fromARGB(255, 36, 36, 36),
      onBackground: Colors.white,
      surface: Color(0xff121212),
      onSurface: Colors.white);

  static const aquamarine = Color(0xff93FFDF);
}
