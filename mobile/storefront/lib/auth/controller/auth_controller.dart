import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/services/toast_service.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/bottom_bar/view/bottom_bar.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signIn() async {
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        Get.offAll(() => const Home());
        clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      ToastService.showToast(message: e.code.toString());
      clearControllers();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
  }

  Future<void> signUp() async {
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        Get.offAll(() => const Home());
        clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      ToastService.showToast(message: e.code.toString());
      clearControllers();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance
          .signOut()
          .then((value) => Get.offAll(() => const SigninScreen()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
