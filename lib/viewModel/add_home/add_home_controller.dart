import 'package:get/get.dart';
import '../../data/models/card/card_Model.dart';
import '../../data/services/card_service.dart';

class AddHomeController extends GetxController {
  var cards = <CardModel>[].obs;

  AddHomeController() {
    print('[AddHomeController] Created');
  }

  void addCard(CardModel card) {
    cards.add(card);
    print('[AddHomeController] Card added. Total cards: ${cards.length}');
  }

  Future<void> submitCard(CardModel card) async {
    final result = await CardService.submitCard(card);
    if (result != null) {
      addCard(result);
      Get.snackbar("Success", "Card Added");
    } else {
      Get.snackbar("Error", "Failed to add card");
    }
  }
}
