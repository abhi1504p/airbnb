import 'package:airbnb/View/add_home/add_home_view.dart';
import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/wlecome/welcome_view.dart';
import '../core/theme_viewmodel.dart';
import '../viewModel/welcome/welcome_controller.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController());
    final themeController = Get.find<ThemeViewModel>();
    final homePageController = Get.find<HomePageController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: AppText.heading('Home', color: AppColors.headingColor(context)),
        actions: [
          TextButton(
            onPressed: () => Get.toNamed('/home'),
            child: AppText.body(
              'Go to Home',
              color: AppColors.bodyColor(context),
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed('/add_home_view'),
            child: AppText.body(
              'Add Home',
              color: AppColors.bodyColor(context),
            ),
          ),
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              icon: Icon(
                themeController.themeMode.value == ThemeMode.dark
                    ? Icons.toggle_on
                    : Icons.toggle_off,
                color: AppColors.bodyColor(context),
                size: 32,
              ),
            ),
          ),
        ],
        toolbarHeight: 80,
        elevation: 0,
      ),

      body: Obx(
        () =>
            homePageController.showRegister.value
                ? AddHomeView()
                : WelcomeView(),
      ),
    );
  }
}
