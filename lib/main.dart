import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';
import 'core/theme/app_theme.dart';
import 'modules/home/home_page.dart';
import 'modules/theme/theme_viewmodel.dart';
import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialBinding: InitialBinding(),

          getPages: AppPages.routes,
          home: Obx(() {
            final themeController = Get.find<ThemeViewModel>();
            return Theme(
              data:
                  themeController.themeMode.value == ThemeMode.dark
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme,
              child: HomeView(),
            );
          }),
        );
      },
    );
  }
}
