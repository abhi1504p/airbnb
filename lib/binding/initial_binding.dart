import 'package:get/get.dart';
import '../modules/theme/theme_viewmodel.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeViewModel(), permanent: true);
  }
}
