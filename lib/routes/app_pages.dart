// used for routing
import 'package:airbnb/modules/add_home/add_home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/home_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/add_home_view', page: () => AddHomeView()),
  ];
}
