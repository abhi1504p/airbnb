import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddHomeView extends StatelessWidget {
  const AddHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    void submitHomeDetails() async {
      final url = Uri.parse(
        'http://localhost:3004/host/add-home',
      ); // Backend endpoint
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'details': name.text,
        }), // Replace with actual form data
      );

      // Handle response based on your application's logic
      if (response.statusCode == 200) {
        Get.toNamed("/home");
        // Optionally handle success response
      } else {
        print("error occured during the handling");
        // Handle other status codes or errors
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: name),
          SizedBox(height: 20),
          ElevatedButton(onPressed: submitHomeDetails, child: Text("Submit")),
        ],
      ),
    );
  }
}
