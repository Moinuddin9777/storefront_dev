import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/bottom_bar/controller/bottom_navigation_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => IndexedStack(
          index: controller.currentIndex,
          children: controller.screens,
        ),
      ),
      bottomNavigationBar: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (value) {
            controller.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
