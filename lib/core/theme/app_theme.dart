import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.lightPrimary,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimary,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light, // ✅ Correct brightness
      secondary: AppColors.lightSecondary,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.darkPrimary,
      titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkSecondary,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark, // ✅ Fix here
      secondary: AppColors.darkSecondary,
    ),
  );
}
