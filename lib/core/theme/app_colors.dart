import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF4A4E69);
  static const Color lightBackground = Color(0xFFF2E9E4);
  static const Color lightSecondary = Color(0xFF9A8C98);
  static const Color lightHeading = Color(0xFF22223B);
  static const Color lightBody = Color(0xFF4A4E69);
  static const Color lightCaption = Color(0xFF9A8C98);

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF23223A);
  static const Color darkBackground = Color(0xFF23223A);
  static const Color darkSecondary = Color(0xFF9A8C98);
  static const Color darkHeading = Colors.white;
  static const Color darkBody = Color(0xFFF2E9E4);
  static const Color darkCaption = Color(0xFF9A8C98);

  // Adaptive getters
  static Color headingColor([BuildContext? context]) {
    if (context == null) return lightHeading;
    return Theme.of(context).brightness == Brightness.dark
        ? darkHeading
        : lightHeading;
  }

  static Color bodyColor([BuildContext? context]) {
    if (context == null) return lightBody;
    return Theme.of(context).brightness == Brightness.dark
        ? darkBody
        : lightBody;
  }

  static Color captionColor([BuildContext? context]) {
    if (context == null) return lightCaption;
    return Theme.of(context).brightness == Brightness.dark
        ? darkCaption
        : lightCaption;
  }

  static Color background([BuildContext? context]) {
    if (context == null) return lightBackground;
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  static Color accent([BuildContext? context]) {
    if (context == null) return lightSecondary;
    return Theme.of(context).brightness == Brightness.dark
        ? darkSecondary
        : lightSecondary;
  }
}
