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
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
              Theme.of(context).colorScheme.primary.withOpacity(0.6)
            ]),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category, color: Colors.black),
                label: 'products',
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.primary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
