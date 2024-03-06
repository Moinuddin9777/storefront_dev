import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/controller.dart';
import 'package:storefront/auth/view/signin_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          'Sign-up',
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
<<<<<<< HEAD
              // name
              TextField(
                controller: authController.nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2_outlined),
                  hintText: 'Name ',
                  suffixIcon: IconButton(
                      onPressed: () => authController.nameController.clear(),
                      icon: const Icon(Icons.clear)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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

=======
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
              //email address
              TextField(
                controller: authController.emailController,
                decoration: InputDecoration(
<<<<<<< HEAD
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Email Address',
                  suffixIcon: IconButton(
                    onPressed: () => authController.emailController.clear(),
                    icon: const Icon(Icons.clear),
=======
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Colors.white),
                  hintText: 'email address',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.emailController.clear(),
                    icon: const Icon(Icons.clear, color: Colors.white),
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
                obscureText: true,
                controller: authController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
<<<<<<< HEAD
                  suffixIcon: IconButton(
                    onPressed: () => authController.passwordController.clear(),
                    icon: const Icon(Icons.clear),
=======
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.passwordController.clear(),
                    icon: const Icon(Icons.clear, color: Colors.white),
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
                authController.errors,
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
                    authController.signUp();
                    authController.emailController.clear();
                    authController.passwordController.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // signup row
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ?',
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => const SigninScreen());
                        authController.clearControllers();
                      },
                      child: const Text(
                        'Sign in',
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
