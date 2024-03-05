import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/bottom_bar/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.offAll(() => const SigninScreen());
        } else {
          Get.offAll(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Center(
          child: Image.asset("assets/splash_bg.png"),
        ),
      ),
    );
  }
}
