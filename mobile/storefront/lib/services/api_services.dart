import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiIntegration {
   Future<List<dynamic>> fetchProducts() async {
    String url = 'http://makeup-api.herokuapp.com/api/v1/products.json?brand=nyx';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }

   Future<bool> checkImageUrlStatus(String url) async {
    try {
      final response = await Dio().head(url);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
