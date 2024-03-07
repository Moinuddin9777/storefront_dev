import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:storefront/home/view/home_screen.dart';
import 'package:storefront/products/view/products_screen.dart';
import 'package:storefront/profile/view/profile_screen.dart';

class BottomBarController extends GetxController {
  var currentIndex = 0;

  final screens = [
    const HomePage(),
    const ProductsPage(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  Widget currentScreen() => screens[currentIndex];
}
