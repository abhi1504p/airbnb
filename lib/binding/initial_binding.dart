import 'package:get/get.dart';

import '../core/theme_viewmodel.dart';
import '../viewModel/add_home/add_home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeViewModel(), permanent: true);
    Get.put(AddHomeController(), permanent: true);
  }
}
