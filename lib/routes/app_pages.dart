// lib/routes/app_pages.dart

import 'package:get/get.dart';

import '../View/add_home/add_home_view.dart';
import '../View/card/add_card_view.dart';
import '../View/notfound/not_found_view.dart';
import '../binding/add_home_binding.dart';
import '../binding/card_binding.dart';
import '../binding/home_binding.dart';
import '../binding/not_found_binding.dart';
import '../home/home_page_view.dart';
import 'app_routes.dart'; // ✅ import the route names

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePageView(),
      binding: HomePageBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.addHome,
      page: () => AddHomeView(),
      binding: AddHomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.addCard,
      page: () => AddCardPage(),
      binding: CardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.notFound,
      page: () => const NotFoundView(),
      binding: NotFoundViewBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
