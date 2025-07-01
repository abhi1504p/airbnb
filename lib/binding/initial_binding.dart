import 'package:airbnb/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
import '../modules/theme/theme_viewmodel.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeViewModel(), permanent: true);
    Get.put(HomePageController());
  }
}
