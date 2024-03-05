import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        emailController.clear();
        passwordController.clear();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint(
            'No user found for that email.'); //Create UI(toast/snackbar) for notifying the user
      } else if (e.code == 'wrong-password') {
        debugPrint(
            'Incorrect password provided for that user.'); //Create UI(toast/snackbar) for notifying the user
      }
    } catch (e) {
      debugPrint(e.toString());
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
        emailController.clear();
        passwordController.clear();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint(
            'The password is too weak.'); //Create UI(toast/snackbar) for notifying the user
      } else if (e.code == 'email-already-in-use') {
        debugPrint(
            'The account already exists for that email.'); //Create UI(toast/snackbar) for notifying the user
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
