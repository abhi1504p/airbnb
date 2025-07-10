import 'package:get/get.dart';

import '../viewModel/add_home/add_home_controller.dart';

class AddHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddHomeController());
  }
}
