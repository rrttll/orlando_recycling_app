import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> getItems() async {
  final response = await http.get(Uri.parse('https://curry-home.cheetoh-python.ts.net/api/v1/items'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load items');
  }
}

Future<Map> getItem(String itemId) async {
  final response = await http.get(Uri.parse('https://curry-home.cheetoh-python.ts.net/api/v1/items/$itemId'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load item');
  }
}