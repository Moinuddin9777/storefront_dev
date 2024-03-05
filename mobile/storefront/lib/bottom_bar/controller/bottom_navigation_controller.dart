import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:storefront/home_screen/view/home_screen.dart";
import "package:storefront/logout/view/logoutbutton.dart";

class NavigationController extends GetxController {
  var currentIndex = 0;

  final screens = [
    const HomePage(),
    const LogoutButton(),
  ];

  void changeIndex(int index) => currentIndex = index;

  Widget currentScreen() => screens[currentIndex];
}
