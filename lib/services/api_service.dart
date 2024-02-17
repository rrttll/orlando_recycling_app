import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const Map<String, String> _headers = {
    "Accept": "application/json",
    "X-CSRFToken": "WBawHw3mgVVfWK4QWj9V6KOL9qkgZihpXf3Zp1b3q1lCfsBemH3TPRN4ubNi0M2U",
  };

  Future<List> getItems() async {
    final response = await http.get(
      Uri.parse('https://curry-home.cheetoh-python.ts.net/api/v1/items'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Map> getItem(String itemId) async {
    final response = await http.get(
      Uri.parse('https://curry-home.cheetoh-python.ts.net/api/v1/items/$itemId'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load item');
    }
  }
}