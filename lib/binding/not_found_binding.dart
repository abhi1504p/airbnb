import 'package:get/get.dart';

import '../View/notfound/not_found_view.dart';

class NotFoundViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotFoundView());
  }
}
