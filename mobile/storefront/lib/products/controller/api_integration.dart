import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/models/product.dart';

class ProductController extends GetxController {
  String brand = '';
  List<Product> products = [];
  bool isLoading = true;

  ProductController(String value) {
    brand = value;
  }

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand';
    debugPrint('get started');
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.toString());
        for (var item in decodedData) {
          if (await checkImageUrlStatus(item['image_link'])) {
            products.add(Product.fromJson(item));
          }
        }
        debugPrint('get completed');
        isLoading = false;
        update();
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
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
