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
