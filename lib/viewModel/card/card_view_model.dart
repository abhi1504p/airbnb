import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/models/card/card_Model.dart';

class CardViewModel extends GetxController {
  final name = ''.obs;
  final location = ''.obs;
  final price = ''.obs;
  final rating = ''.obs;
  final imageUrl = ''.obs;

  final isLoading = false.obs;

  Future<void> submitCard() async {
    isLoading.value = true;

    final card = CardModel(
      name: name.value,
      location: location.value,
      price: double.tryParse(price.value) ?? 0,
      rating: double.tryParse(rating.value) ?? 0,
      imageUrl: imageUrl.value,
    );

    final url = Uri.parse(
      "http://localhost:3003/card",
    ); // ➡️ Replace with your actual backend route

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": card.name,
          "location": card.location,
          "price": card.price,
          "rating": card.rating,
          "imageUrl": card.imageUrl,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        Get.snackbar("Success", "Card Added");
      } else {
        Get.snackbar("Error", "Failed to add card: ${response.reasonPhrase}");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
