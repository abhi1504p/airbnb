// used for routing
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/home_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
    ),
  ];
}
