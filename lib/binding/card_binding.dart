import 'package:airbnb/viewModel/card/card_view_model.dart';
import 'package:get/get.dart';

import '../View/notfound/not_found_view.dart';

class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardViewModel());
  }
}
