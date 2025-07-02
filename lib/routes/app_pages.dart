// used for routing
import 'package:airbnb/modules/add_home/add_home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/home_page_view.dart';
import '../modules/not_found/not_found_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/home', page: () => HomePageView()),
    GetPage(name: '/add_home_view', page: () => AddHomeView()),
    GetPage(
      name: '/not-found',
      page: () => const NotFoundView(),
    ),
  ];
}
