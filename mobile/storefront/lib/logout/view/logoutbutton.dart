import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signin_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
      
          final user = snapshot.data;
          if (user == null) {
            // User is signed out, go to SigninScreen
            return const SigninScreen();
          } else {
            // User is still signed in, show LogoutButton
            return Center(
              child: IconButton(
                onPressed: () {
                  Get.find<AuthController>().signOut();
                  // Get.offAll(() => const SigninScreen());
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}