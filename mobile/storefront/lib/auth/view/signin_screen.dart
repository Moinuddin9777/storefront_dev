import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signup_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        leading: Icon(
          Icons.login,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          'Sign-in',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: authController.emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Email address',
                  suffixIcon: IconButton(
                    onPressed: () => authController.emailController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //password
              TextField(
<<<<<<< HEAD
=======
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
                controller: authController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => authController.passwordController.clear(),
                    icon: const Icon(
                      Icons.clear,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),

              Text(
                authController.error1,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.red),
              ),
              const SizedBox(height: 20),
              // login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    authController.signIn();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => const SignupScreen());
                        authController.clearControllers();
                      },
                      child: const Text(
                        'Sign up',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
