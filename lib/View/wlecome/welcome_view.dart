import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/theme_viewmodel.dart';
import 'package:airbnb/viewModel/welcome/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeController = Get.find<WelcomeController>();
    final themeController = Get.find<ThemeViewModel>();

    bool isDarkMode = themeController.themeMode.value == ThemeMode.dark;

    return Obx(() {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: welcomeController.isVisible.value ? 1.0 : 0.0,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color:
                  isDarkMode
                      ? Colors.grey[850]
                      : AppColors.lightPrimary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color:
                      isDarkMode
                          ? Colors.black26
                          : Colors.grey.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.home, size: 48, color: AppColors.lightPrimary),
                const SizedBox(height: 12),
                Text(
                  'Welcome to Airbnb!',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Find your perfect stay and explore the world with us.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
