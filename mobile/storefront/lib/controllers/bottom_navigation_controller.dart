
import "package:flutter/material.dart";
import "package:get/get.dart";




class NavigationController extends GetxController {
  var currentIndex = 0; 

  final screens = [
    // HomeScreen(),
    // AccountScreen(),
  ];

  void changeIndex(int index) => currentIndex = index;

  Widget currentScreen() => screens[currentIndex];
}