import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:storefront/utils/consts/api_consts.dart';

class ApiServices {
   Future<List<dynamic>> fetchProducts() async {
    String url = "$API_URL?brand=nyx";
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return [];
    }
  }
}
