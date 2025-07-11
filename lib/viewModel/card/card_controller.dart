import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/models/card/card_Model.dart';
import '../add_home/add_home_controller.dart';
import '../../data/services/card_service.dart';
import '../../routes/app_routes.dart';

class CardController extends GetxController {
  final name = ''.obs;
  final location = ''.obs;
  final price = ''.obs;
  final rating = ''.obs;
  final imageUrl = ''.obs;

  final isLoading = false.obs;

  Future<void> submitCard() async {
    if (name.value.isEmpty ||
        location.value.isEmpty ||
        imageUrl.value.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields.");
      return;
    }
    isLoading.value = true;
    final card = CardModel(
      name: name.value,
      location: location.value,
      price: double.tryParse(price.value) ?? 0,
      rating: double.tryParse(rating.value) ?? 0,
      imageUrl: imageUrl.value,
    );
    try {
      final addHomeController = Get.find<AddHomeController>();
      await addHomeController.submitCard(card);
      // Clear form fields
      name.value = '';
      location.value = '';
      price.value = '';
      rating.value = '';
      imageUrl.value = '';
      // Navigate to AddHomeView
      Get.offAllNamed(AppRoutes.addHome);
    } finally {
      isLoading.value = false;
    }
  }
}
