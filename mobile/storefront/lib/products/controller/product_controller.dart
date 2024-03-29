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
  bool isLoading = false;
  List<String> categories = Categories().categories;
  int currentPage = 1;
  int perPage = 10; // Adjust the number of products per page as needed

  @override
  void onInit() {
    loadAllProducts(); // Load all products initially
    super.onInit();
  }

  void loadAllProducts() async {
    isLoading = true;
    update();

    try {
      final decodedData = await ApiServices().fetchAllProducts(currentPage, perPage);
      totalProducts.addAll(decodedData.map((item) => Product.fromJson(item)));
      products.addAll(totalProducts);
    } catch (e) {
      debugPrint('Error: $e');
    }
    isLoading = false;
    update();
  }

  void loadProducts(String brand) async {
    isLoading = true;
    brandProducts.clear();
    products.clear();
    update();

    try {
      final decodedData = await ApiServices().fetchProducts(brand);
      for (var item in decodedData) {
        if (await ApiServices().checkImageUrlStatus(item['image_link']) == true) {
          products.add(Product.fromJson(item));
          brandProducts.add(Product.fromJson(item));
        }
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isLoading = false;
    update();
  }

  void loadMoreProducts() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    update();

    try {
      final decodedData = await ApiServices().fetchAllProducts(currentPage, perPage);
      totalProducts.addAll(decodedData.map((item) => Product.fromJson(item)));
      products.addAll(decodedData.map((item) => Product.fromJson(item)));
    } catch (e) {
      debugPrint('Error: $e');
    }
    isLoading = false;
    update();
  }

  // void loadProductsfromBrand(String brand) async {
  //   if (brand == "All") {
  //     products = totalProducts;
  //   } else {
  //     products =
  //         totalProducts.where((element) => element.brand == brand).toList();
  //     brandProducts = products;
  //     update();
  //   }
  // }

  void loadProductsfromCategory(String type) async {
    if (type != "None") {
      if (brandProducts.isEmpty) {
        products =
            brandProducts.where((element) => element.category == type).toList();
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
