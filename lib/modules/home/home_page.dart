import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme_viewmodel.dart';

class HomeView extends StatelessWidget {
  final ThemeViewModel themeController = Get.find<ThemeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme MVVM Example'),
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeController.toggleTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Hello, This is Theme Switcher!',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
