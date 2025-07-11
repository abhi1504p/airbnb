import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airbnb/core/widgets/app_button.dart';

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
              Icon(
                Icons.error_outline,
                color: AppColors.accent(context),
                size: 80,
              ),
              const SizedBox(height: 16),
              AppText.heading(
                '404-Page Not Found!',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.headingColor(context),
              ),

              const SizedBox(height: 8),
              AppText.body(
                'Oops! The page you are looking for does not exist.',
                textAlign: TextAlign.center,
                color: AppColors.bodyColor(context).withOpacity(0.7),
              ),
              const SizedBox(height: 24),
              AppButton(
                type: ButtonType.filled,
                onPressed: () {
                  Get.offAllNamed('/home');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.home, color: Colors.white),
                    const SizedBox(width: 8),
                    AppText.body(
                      'Go Back to Home',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
