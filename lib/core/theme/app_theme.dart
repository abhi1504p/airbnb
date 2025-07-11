import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF4A4E69),
    scaffoldBackgroundColor: const Color(0xFFF2E9E4),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        color: const Color(0xFF22223B),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Color(0xFF22223B)),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: GoogleFonts.poppins(color: const Color(0xFF22223B)),
      titleLarge: GoogleFonts.poppins(
        color: const Color(0xFF22223B),
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF4A4E69),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF2E9E4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      labelStyle: GoogleFonts.poppins(color: const Color(0xFF9A8C98)),
      prefixIconColor: const Color(0xFF9A8C98),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      secondary: const Color(0xFF9A8C98),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A4E69),
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        elevation: 8,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF23223A),
    scaffoldBackgroundColor: const Color(0xFF23223A),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyMedium: GoogleFonts.poppins(color: Colors.white),
      titleLarge: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF9A8C98),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF23223A),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF23223A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      labelStyle: GoogleFonts.poppins(color: const Color(0xFFF2E9E4)),
      prefixIconColor: const Color(0xFFF2E9E4),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,
      secondary: const Color(0xFF9A8C98),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9A8C98),
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
        elevation: 8,
      ),
    ),
  );
}
