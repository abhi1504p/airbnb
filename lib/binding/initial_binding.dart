import 'package:get/get.dart';

import '../core/theme_viewmodel.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeViewModel(), permanent: true);
  }
}
