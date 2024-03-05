import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signin_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            Get.find<AuthController>().signOut();
            Get.offAll(() => const SigninScreen());
          },
          icon: const Icon(
            Icons.exit_to_app,
          ),
        ),
      ),
    );
  }
}
