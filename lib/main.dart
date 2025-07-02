import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart'; // ✅ Import this
import 'core/theme/app_theme.dart';
import 'modules/not_found/not_found_view.dart';
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
    final ThemeViewModel themeController = Get.put(
      ThemeViewModel(),
    ); // ✅ Put here for safety (Optional)

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(() {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode.value,

            initialBinding: InitialBinding(),
            getPages: AppPages.routes,
            initialRoute: '/home',
            unknownRoute: GetPage(
              name: '/not-found',
              page: () => const NotFoundView(),
            ),
          );
        });
      },
    );
  }
}
