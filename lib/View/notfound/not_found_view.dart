import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: AppColors.errorColor, size: 80),
              const SizedBox(height: 16),
              AppText.heading(
                '404-Page Not Found!',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),

              const SizedBox(height: 8),
              AppText.body(
                'Oops! The page you are looking for does not exist.',
                textAlign: TextAlign.center,

                color: Colors.black54,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                icon: const Icon(Icons.home, color: Colors.white),
                label: const Text(
                  'Go Back to Home',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  Get.offAllNamed('/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
