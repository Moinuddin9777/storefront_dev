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
      backgroundColor: const Color.fromRGBO(15, 15, 15, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
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
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Colors.white),
                  hintText: 'email address',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.emailController.clear(),
                    icon: const Icon(Icons.clear, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(200, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //password
              TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: authController.passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.passwordController.clear(),
                    icon: const Icon(Icons.clear, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(200, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    authController.signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
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
                    const Text(
                      'Don\'t have an account ?',
                      style: TextStyle(
                        color: Colors.white,
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
