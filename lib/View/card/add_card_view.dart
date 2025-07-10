import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/card/card_view_model.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    CardViewModel cardVM = Get.find<CardViewModel>();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Beautiful Card')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08, vertical: 20),
        child: Column(
          children: [
            _buildAnimatedTextField('Name', cardVM.name),
            _buildAnimatedTextField('Location', cardVM.location),
            _buildAnimatedTextField(
              'Price',
              cardVM.price,
              inputType: TextInputType.number,
            ),
            _buildAnimatedTextField(
              'Rating',
              cardVM.rating,
              inputType: TextInputType.number,
            ),
            _buildAnimatedTextField('Image URL', cardVM.imageUrl),
            const SizedBox(height: 20),
            Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    cardVM.isLoading.value
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: cardVM.submitCard,
                          child: const Text("Submit"),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField(
    String label,
    RxString controller, {
    TextInputType? inputType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          keyboardType: inputType ?? TextInputType.text,
          onChanged: (val) => controller.value = val,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    );
  }
}
