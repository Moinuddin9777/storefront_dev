import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/models/categories.dart';
import 'package:storefront/products/models/product.dart';
import 'package:storefront/products/services/api_service.dart';

class ProductController extends GetxController {
  List<Product> products = [];
  List<Product> brandProducts = [];
  List<Product> totalProducts = [];
  bool isLoading = true;
  List<String> categories = Categories().categories;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    debugPrint("Loading products called");
    try {
      final decodedData = await ApiServices().fetchProducts();
      for (var item in decodedData) {
        products.add(Product.fromJson(item));
        totalProducts.add(Product.fromJson(item));
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

  void sortProductsByPrice() {
    products.sort((a, b) => b.price!.compareTo(a.price!));
    update();
  }

  void selecteItems(String value) {
    loadProductsfromCategory(value);
  }
}
