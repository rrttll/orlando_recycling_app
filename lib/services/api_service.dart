// File: /lib/services/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final http.Client client;
  static const Map<String, String> _headers = {
    "Accept": "application/json",
   // "X-CSRFToken": "WBawHw3mgVVfWK4QWj9V6KOL9qkgZihpXf3Zp1b3q1lCfsBemH3TPRN4ubNi0M2U",
  };

  // Allow passing a custom client for testing, defaulting to a new instance of http.Client
  ApiService({http.Client? client}) : client = client ?? http.Client();

  Future<List<dynamic>> getItems() async {
    final response = await client.get(
      Uri.parse('https://curry-home.cheetoh-python.ts.net/api/items'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      // Use 'dynamic' for JSON decoding as it returns a dynamic structure
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<dynamic> getItem(String itemId) async {
    final response = await client.get(
      Uri.parse('https://curry-home.cheetoh-python.ts.net/api/items/$itemId'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      // Return type changed to 'dynamic' to match the return type of json.decode
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load item');
    }
  }
}
