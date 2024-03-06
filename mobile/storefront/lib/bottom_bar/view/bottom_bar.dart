import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/bottom_bar/controller/bottom_navigation_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (controller) => IndexedStack(
          index: controller.currentIndex,
          children: controller.screens,
        ),
      ),
      bottomNavigationBar: GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (controller) => Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(253, 177, 216, 1.0),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category, color: Colors.black),
                label: 'products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.black),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
