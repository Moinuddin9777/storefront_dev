import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/auth_controller.dart';
import 'package:storefront/auth/view/reset_password_screen.dart';

class EditProfileScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field for editing username
            TextFormField(
              controller: _authController.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            // Text field for editing phone number
            TextFormField(
              controller: _authController.phonenumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            // Elevated button for resetting password
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ResetPasswordScreen());
              },
              child: const Text('Reset Password'),
            ),
            const SizedBox(height: 20),
            // Elevated button for submitting changes
            ElevatedButton(
              onPressed: () {
                _authController.setUsername(
                    _authController.usernameController.text.trim());
                _authController.setPhoneNumber(
                    _authController.phonenumberController.text.trim());
                Get.back();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
// profile/view/edit_profile_screen.dart