import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/card/card_Model.dart';

class CardService {
  static Future<CardModel?> submitCard(CardModel card) async {
    final url = Uri.parse(
      "http://localhost:3003/store/homeCard",
    ); // Update as needed
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

      print('[CardService] Backend response: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        return CardModel(
          name: data['data']['name'],
          location: data['data']['location'],
          price: (data['data']['price'] as num).toDouble(),
          rating: (data['data']['rating'] as num).toDouble(),
          imageUrl: data['data']['imageUrl'],
        );
      }
      return null;
    } catch (e) {
      print('[CardService] Exception: $e');
      return null;
    }
  }

  static Future<List<CardModel>> getAllCards() async {
    final url = Uri.parse(
      "http://localhost:3003/store/homeCard",
    ); // Update as needed
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );


      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print(data);
        // Assuming the backend returns a list under data['data']
        final List<dynamic> cardList = data['data'] ?? [];
        return cardList
            .map(
              (json) => CardModel(
                name: json['name'],
                location: json['location'],
                price: (json['price'] as num).toDouble(),
                rating: (json['rating'] as num).toDouble(),
                imageUrl: json['imageUrl'],

              ),
            )
            .toList();
      }
      return [];
    } catch (e) {
      print('[CardService] Exception: $e');
      return [];
    }
  }
}
