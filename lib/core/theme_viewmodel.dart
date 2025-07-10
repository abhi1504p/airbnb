import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeViewModel extends GetxController {

  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  bool get isDarkMode => themeMode.value == ThemeMode.dark;

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
    Get.changeThemeMode(themeMode.value);  // Notify GetX to apply new theme
  }
}
