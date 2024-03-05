import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          // Get.offAll(()=>const HomeScreen());
        } else {
          // Get.offAll(()=>const LoginScreen());
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    //UI for SplashScreen
    return const Scaffold();
  }
}
