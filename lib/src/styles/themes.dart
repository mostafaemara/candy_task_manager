import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.all(8),
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
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff121212),
      colorScheme: AppColors.darkColorSchema,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          fillColor: AppColors.darkColorSchema.background,
          filled: true),
    );
  }
}
