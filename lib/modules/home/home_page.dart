import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/modules/add_home/add_home_view.dart';
import 'package:airbnb/modules/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme_viewmodel.dart';

class HomeView extends StatelessWidget {
  final ThemeViewModel themeController = Get.find<ThemeViewModel>();
  final HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimary, // Set background color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Get.toNamed('/home'),
              child: AppText('Go to Home', color: AppColors.textcolor),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/add_home_view'),
              child: AppText('Add Home', color: AppColors.textcolor),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.toggle_off, color: AppColors.textcolor),
            ),
          ],
        ),
        toolbarHeight: 80,  // Set custom height
        elevation: 0,        // Remove shadow if needed
      ),

      body: Obx(
        () =>
            homePageController.showRegister.value
                ? AddHomeView()
                : Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        'Welcome to airbnb',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
