import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';

class AppTheme {
  static _theme(
    Brightness brightness,
    Color scaffoldBackgroundColor,
  ) =>
      ThemeData(
        primaryColor: AppColors.primary,
        brightness: brightness,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: 'Satoshi',
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(23),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      );

  static final lightTheme = _theme(
    Brightness.light,
    AppColors.lightBackground,
  );

  static final darkTheme = _theme(
    Brightness.dark,
    AppColors.darkBackground,
  );
}
