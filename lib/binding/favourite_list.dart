import 'package:airbnb/View/favorite_list/favourite_list_view.dart';
import 'package:airbnb/viewModel/favourite_list/favourite_list_controller.dart';
import 'package:get/get.dart';

import '../home/home_page_controller.dart';

class FavouriteList extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>FavouriteListController());
  }
}