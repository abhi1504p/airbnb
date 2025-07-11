import 'package:airbnb/viewModel/card/card_controller.dart';
import 'package:get/get.dart';
import '../viewModel/add_home/add_home_controller.dart';

import '../View/notfound/not_found_view.dart';

class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardController());
    Get.lazyPut(() => AddHomeController());
  }
}
