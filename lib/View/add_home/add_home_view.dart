import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddHomeView extends StatelessWidget {
  const AddHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: name),
          SizedBox(height: 20),
          ElevatedButton(onPressed: {}, child: Text("Submit")),
        ],
      ),
    );
  }
}
