import 'package:get/get.dart';
import '../../data/models/card/card_Model.dart';
import '../../data/services/card_service.dart';

class FavouriteListController extends GetxController {
  var cards = <CardModel>[].obs;

  FavouriteListController() {
    print('[AddHomeController] Created');
  }

  void addCard(CardModel card) {
    cards.add(card);
    print('[AddHomeController] Card added. Total cards: ${cards.length}');
  }

  Future<void> fetchAllCards() async {
    final result = await CardService.getAllCards();
    if (result.isNotEmpty) {
      cards.assignAll(result);
      Get.snackbar("Success", "Cards Loaded");
    } else {
      Get.snackbar("Error", "Failed to load cards");
    }
  }
}