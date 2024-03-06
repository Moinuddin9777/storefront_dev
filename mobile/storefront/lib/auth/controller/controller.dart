import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String error1 = '';
  String errors = '';
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
        debugPrint('No user found for that email.');
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
