import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/product_screen/models/categories.dart';
import 'package:storefront/product_screen/models/product.dart';

class ProductController extends GetxController {
  List<Product> totalProducts = [];
  List<Product> products = [];
  List<Product> brandProducts = [];
  bool isLoading = true;
  List<String> categories = Categories().categories;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    debugPrint("Loading products called");
    String url = 'http://makeup-api.herokuapp.com/api/v1/products.json?brand=nyx';
    try {
      final response = await Dio().get(url);
      // await Future.delayed(const Duration(seconds: 4), () {
      //   isLoading = false;
      //   update();
      // });
      if (response.statusCode == 200) {
        final decodedData = response.data as List<dynamic>;
        for (var item in decodedData) {
          if (await checkImageUrlStatus(item['image_link'])) {
            products.add(Product.fromJson(item));
            totalProducts.add(Product.fromJson(item));
          }
        }
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isLoading = false;
    update();
    debugPrint("Loading products completed");
  }

  void loadProductsfromBrand(String brand) async {
    if (brand == "All") {
      products = totalProducts;
    } else {
      products =
          totalProducts.where((element) => element.brand == brand).toList();
      brandProducts = products;
      update();
    }
  }

  void loadProductsfromCategory(String type) async {
    if (type != "None") {
      if (brandProducts.isEmpty) {
        products =
            totalProducts.where((element) => element.category == type).toList();
        update();
      } else {
        products =
            brandProducts.where((element) => element.category == type).toList();
        update();
      }
    } else if (type == "None") {
      if (brandProducts.isEmpty) {
        products = totalProducts;
        update();
      } else {
        products = brandProducts;
        update();
      }
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

  void sortProductsByPrice() {
    products.sort((a, b) => b.price!.compareTo(a.price!));
    update();
  }

  void selecteItem(String value) {
    loadProductsfromCategory(value);
  }
}
