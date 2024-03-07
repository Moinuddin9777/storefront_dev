import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/controller/auth_controller.dart';
import 'package:storefront/auth/view/signup_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromRGBO(15, 15, 15, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        leading: const Icon(
          Icons.login,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        centerTitle: true,
        title: const Text(
          'Sign-in',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
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
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                cursorColor: Theme.of(context).colorScheme.onBackground,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,
                      color: Theme.of(context).colorScheme.onBackground),
                  hintText: 'email address',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.emailController.clear(),
                    icon: Icon(Icons.clear,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //password
              TextField(
                obscureText: true,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
                cursorColor: Theme.of(context).colorScheme.onBackground,
                controller: authController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,
                      color: Theme.of(context).colorScheme.onBackground),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.passwordController.clear(),
                    icon: Icon(Icons.clear,
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // login button
              GetBuilder(
                init: AuthController(),
                builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        authController.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(253, 177, 216, 1.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: controller.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                              )
                            : const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                      ),
                    ),
                  );
                },
              ),

              // // forgot password
              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       // Action to perform for forgot password
              //     },
              //     child: const Text(
              //       'Forgot Password',
              //       style: TextStyle(
              //         color: Colors.blue, // Set the text color to blue
              //       ),
              //     ),
              //   ),
              // ),

              // signup row
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => const SignupScreen());
                        authController.clearControllers();
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.blue, // Set the text color to blue
                        ),
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
