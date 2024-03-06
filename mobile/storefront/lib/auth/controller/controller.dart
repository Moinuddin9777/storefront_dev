import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/services/toast_service.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/bottom_bar/view/home.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Future<void> signIn() async {
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
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        ToastService.showToast(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Incorrect password provided for that user.');
        ToastService.showToast(
            message: 'Incorrect password provided for that user.');
      } else {
        ToastService.showToast(message: e.code.toString());
      }
    }
  }

  Future<void> signUp() async {
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
      if (e.code == 'weak-password') {
        debugPrint('The password is too weak.');
        ToastService.showToast(message: 'The password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        ToastService.showToast(message: 'email-already-in-use');
      } else {
        ToastService.showToast(message: e.code.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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
    nameController.clear();
  }
}
