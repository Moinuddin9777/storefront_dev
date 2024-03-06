import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/models/product.dart';

class ProductController extends GetxController {
  String brand = '';
  List<Product> products = [];
  bool isLoading = true;

  // ProductController(String value) {
  //   brand = value;
  // }

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    String url = 'http://makeup-api.herokuapp.com/api/v1/products.json';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.toString());
        for (var item in decodedData) {
          if (await checkImageUrlStatus(item['image_link'])) {
            products.add(Product.fromJson(item));
            update();
          }
        }
        isLoading = false;
        update();
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void loadProductsfromBrand(String brand) async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=$brand';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.toString());
        for (var item in decodedData) {
          if (await checkImageUrlStatus(item['image_link'])) {
            products.add(Product.fromJson(item));
            update();
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

  void loadProductsfromCategory(String type) async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?product_type=$type';
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.toString());
        for (var item in decodedData) {
          if (await checkImageUrlStatus(item['image_link'])) {
            products.add(Product.fromJson(item));
            update();
          }
        }
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

  static List<dynamic> sortProductsByPrice(List<dynamic> products) {
    products.sort((a, b) => a['price'].compareTo(b['price']));
    return products;
  }

  static List<dynamic> sortProductsByRating(List<dynamic> products) {
    products.sort((a, b) => b['rating'].compareTo(a['rating']));
    return products;
  }
}
