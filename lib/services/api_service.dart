// File: lib/services/api_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<dynamic>> getItems() async {
    const url = 'https://curry-home.cheetoh-python.ts.net/items';
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'accept': 'application/json',
            'X-CSRFToken': 'bO3DSFiRkgAxtSHyAy48Th9tvVDcbEVF', // replace with your actual CSRF token
          },
        ),
      );

      print('getItems response status: ${response.statusCode}');
      print('getItems response data: ${response.data}');

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        return jsonDecode(response.data);
      } else {
        // If the server returns an unexpected response, throw an exception.
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load items: $e');
    }
  }

  Future<dynamic> getItem(String itemId) async {
    String url = 'https://curry-home.cheetoh-python.ts.net/items/$itemId';
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'accept': 'application/json',
            'X-CSRFToken': 'bO3DSFiRkgAxtSHyAy48Th9tvVDcbEVF', // replace with your actual CSRF token
          },
        ),
      );

      print('getItem response status: ${response.statusCode}');
      print('getItem response data: ${response.data}');

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        return jsonDecode(response.data);
      } else {
        // If the server returns an unexpected response, throw an exception.
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load item: $e');
    }
  }
}