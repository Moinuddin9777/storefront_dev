import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/view/reset_password_screen.dart';
import 'package:storefront/profile/controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final profileController = Get.find<ProfileController>();

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
              controller: profileController.usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            // Text field for editing phone number
            TextFormField(
              controller: profileController.phoneController,
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
                profileController.updateProfile();
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