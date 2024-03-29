import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/view/reset_password_screen.dart';
import 'package:storefront/profile/controller/imagepicker_controller.dart';
import 'package:storefront/profile/controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final profileController = Get.find<ProfileController>();

  EditProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<ImagePickerController>(
                builder: (controller) {
                  return Center(
                    child: InkWell(
                      onTap: () async {
                        await controller.pickImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: SizedBox(
                                width: 300,
                                height: 300,
                                child: controller.image != null
                                    ? Image.file(controller.image!,
                                        fit: BoxFit.cover)
                                    : Image.asset("assets/profile_img.png",
                                        fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.7),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
                  profileController.clearControllers();
                  Get.back();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// profile/view/edit_profile_screen.dart
