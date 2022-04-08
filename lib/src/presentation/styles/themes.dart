import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            fillColor: Colors.white,
            filled: true),
        fontFamily: "Cairo",
        colorScheme: AppColors.lightColorSchema,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w300),
                onPrimary: AppColors.lightColorSchema.onSecondary,
                primary: AppColors.lightColorSchema.secondary)));
  }

  static ThemeData get darkTheme {
    return ThemeData.dark();
  }
}
