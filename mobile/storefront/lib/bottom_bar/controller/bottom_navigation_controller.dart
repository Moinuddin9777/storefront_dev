import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:storefront/home_screen/view/home_screen.dart";
import "package:storefront/logout/view/logoutbutton.dart";
import "package:storefront/products/view/products_page.dart";

class BottomBarController extends GetxController {
  var currentIndex = 0;

  final screens = [
    const HomePage(),
    const LogoutButton(),
    const ProductsPage(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  Widget currentScreen() => screens[currentIndex];
}
