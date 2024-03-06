import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/home_screen/view/home_screen.dart';
import 'package:storefront/logout/view/image_controller.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageController controller = Get.put(ImageController());
    String name = Get.find<AuthController>().emailController.text;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (ctx) => const HomePage()));
          },
        ),
        title: Text(
          'Profile Page',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
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
            }
            // User is still signed in, show LogoutButton
            return GetBuilder<ImageController>(
              builder: (logic) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        'Try to add Profile Photo',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: logic.image != null
                            ? FileImage(controller.image as File)
                            : null,
                      ),
                      const SizedBox(height: 10),
                      TextButton.icon(
                          onPressed: controller.imagePicker,
                          icon: const Icon(Icons.image),
                          label: const Text('Add image')),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                          onPressed: () {
                            Get.find<AuthController>().signOut();

                            Get.offAll(() => const SigninScreen());
                          },
                          icon: Icon(
                            Icons.exit_to_app,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: const Text('Logout')),
                    ],
                  )),
                );
              },
            );
          }),
    );
  }
}
