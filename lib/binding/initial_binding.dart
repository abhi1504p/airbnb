import 'package:airbnb/modules/home/home_page_controller.dart';
import 'package:get/get.dart';
import 'package:airbnb/modules/Welcome/welcome_controller.dart';
import '../modules/theme/theme_viewmodel.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeViewModel(), permanent: true);
    Get.put(HomePageController(), permanent: true);
    Get.put(WelcomeController(), permanent: true); // Add this line
  }
}
