import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
