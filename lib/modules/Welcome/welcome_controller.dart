import 'package:get/get.dart';

class WelcomeController extends GetxController {
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Trigger animation after a slight delay for effect
    Future.delayed(const Duration(milliseconds: 300), () {
      isVisible.value = true;
    });
  }
}
