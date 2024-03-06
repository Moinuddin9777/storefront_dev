import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/splashscreen/controller/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    Get.put(AuthController());
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
            Theme.of(context).colorScheme.primary.withOpacity(0.6)
          ]),
        ),
        child: Center(
          child: Image.asset("assets/splash_bg.png"),
        ),
      ),
    );
  }
}
