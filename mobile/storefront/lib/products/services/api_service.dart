import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:storefront/utils/consts/api_consts.dart';

class ApiServices {
  Future<List<dynamic>> fetchProducts(String brand) async {
    String url = "$API_URL?brand=$brand";
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

  Future<bool> checkImageUrlStatus(String url) async {
    try {
      final response = await Dio().get(url);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
