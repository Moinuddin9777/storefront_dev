import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:fluttertoast/fluttertoast.dart';
=======
import 'package:storefront/auth/services/toast_service.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/bottom_bar/view/home.dart';
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
<<<<<<< HEAD
  String error1 = '';
  String errors = '';
=======

>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
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
<<<<<<< HEAD
        Fluttertoast.showToast(
            msg: 'No user found for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0); //Create UI(toast/snackbar) for notifying the user
      } else if (e.code == 'wrong-password') {
        debugPrint('Incorrect password provided for that user.');
        Fluttertoast.showToast(
            msg: 'Incorrect password provided for that user.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //Create UI(toast/snackbar) for notifying the user
=======
        ToastService.showToast(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Incorrect password provided for that user.');
        ToastService.showToast(
            message: 'Incorrect password provided for that user.');
      } else {
        ToastService.showToast(message: e.code.toString());
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
      }
    }
  }

  Future<void> signUp() async {
    try {
      if (emailController.text.isEmpty ||
          emailController.text.length < 10 ||
          passwordController.text.length < 6 ||
          nameController.text.isEmpty) {
        errors = 'Invalid email and password and name';
        print(errors);
      }
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
