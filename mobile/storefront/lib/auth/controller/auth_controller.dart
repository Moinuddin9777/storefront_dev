import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storefront/home/view/bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/auth/services/toast_service.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController usernameController;
  late TextEditingController phonenumberController;
  late TextEditingController resetPasswordController;
  late String username;
  late String phoneNumber;
  //visibilities of passwords
  bool obscureTextSigninPassword = true;
  bool obscureTextSignupPassword = true;
  bool obscureTextSignupConfirmPassword = true;
  //loading
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
    phonenumberController = TextEditingController();
    resetPasswordController = TextEditingController();
    username = '';
    phoneNumber = '';
  }

  //sign in with email and password
  Future<void> signIn() async {
    validateSignin();
    isLoading = true;
    update();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          Get.offAll(() => const Home());
        },
      );
    } on FirebaseAuthException catch (e) {
      ToastService.showToast(message: e.code.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    clearControllers();
    isLoading = false;
    update();
  }

  //sign up with email and password
  Future<void> signUp() async {
    validateSignup();
    isLoading = true;
    update();
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) {
          Get.offAll(() => const Home());

          //add user
          FirebaseFirestore.instance.collection("users").add({
            'email': emailController.text.trim(),
            'username': usernameController.text.trim(),
            'password': passwordController.text.trim(),
            'phonenumber': phonenumberController.text.trim(),
          });

          // Set username and phone number in AuthController
          setUsername(usernameController.text.trim());
          setPhoneNumber(phonenumberController.text.trim());

          clearControllers();
        });
      } else {
        ToastService.showToast(message: "Passwords do not match");
        passwordController.clear();
        confirmPasswordController.clear();
      }
    } on FirebaseAuthException catch (e) {
      ToastService.showToast(message: e.code.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
  }

  //signout from device
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance
          .signOut()
          .then((value) => Get.offAll(() => const SigninScreen()));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //clear text fields
  void clearControllers() {
    usernameController.clear();
    phonenumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  //validation of fields for signup
  void validateSignup() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        phonenumberController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      return ToastService.showToast(message: "Please fill in all fields");
    }
  }

  //validation of fields for signin
  void validateSignin() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return ToastService.showToast(message: "Please fill in all fields");
    }
  }

  //hide show password
  void toggleSigninPassword() {
    if (obscureTextSigninPassword) {
      obscureTextSigninPassword = false;
    } else {
      obscureTextSigninPassword = true;
    }
    update();
  }

  void toggleSignupPassword() {
    if (obscureTextSignupPassword) {
      obscureTextSignupPassword = false;
    } else {
      obscureTextSignupPassword = true;
    }
    update();
  }

  void toggleSignupConfirmPassword() {
    if (obscureTextSignupConfirmPassword) {
      obscureTextSignupConfirmPassword = false;
    } else {
      obscureTextSignupConfirmPassword = true;
    }
    update();
  }

  // Setters for username and phone number
  void setUsername(String name) {
    username = name;
    update();
  }

  void setPhoneNumber(String number) {
    phoneNumber = number;
    update();
  }
} 
// auth/controller/auth_controller.dart


// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:storefront/home/view/bottom_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:storefront/auth/view/signin_screen.dart';
// import 'package:storefront/auth/services/toast_service.dart';

// class AuthController extends GetxController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController phonenumberController = TextEditingController();
//   TextEditingController resetPasswordController = TextEditingController();
//   //visibilities of passwords
//   bool obscureTextSigninPassword = true;
//   bool obscureTextSignupPassword = true;
//   bool obscureTextSignupConfirmPassword = true;
//   //loading 
//   bool isLoading = false;

//   //sign in with email and password
//   Future<void> signIn() async {
//     validateSignin();
//     isLoading = true;
//     update();
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       )
//           .then(
//         (value) {
//           Get.offAll(() => const Home());
//         },
//       );
//     } on FirebaseAuthException catch (e) {
//       ToastService.showToast(message: e.code.toString());
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     clearControllers();
//     isLoading = false;
//     update();
//   }

//   //sign up with email and password
//   Future<void> signUp() async {
//     validateSignup();
//     isLoading = true;
//     update();
//     try {
//       if (passwordController.text == confirmPasswordController.text) {
//         await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         )
//             .then((value) {
//           Get.offAll(() => const Home());

//           //add user
//           FirebaseFirestore.instance.collection("users").add({
//             'email': emailController.text.trim(),
//             'username': usernameController.text.trim(),
//             'password': passwordController.text.trim(),
//             'phonenumber': phonenumberController.text.trim(),
//           });
//           clearControllers();
//         });
//       } else {
//         ToastService.showToast(message: "Passwords do not match");
//         passwordController.clear();
//         confirmPasswordController.clear();
//       }
//     } on FirebaseAuthException catch (e) {
//       ToastService.showToast(message: e.code.toString());
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     isLoading = false;
//     update();
//   }

//   //signout from device
//   Future<void> signOut() async {
//     try {
//       await FirebaseAuth.instance
//           .signOut()
//           .then((value) => Get.offAll(() => const SigninScreen()));
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   //clear text fields
//   void clearControllers() {
//     usernameController.clear();
//     phonenumberController.clear();
//     emailController.clear();
//     passwordController.clear();
//     confirmPasswordController.clear();
//   }

//   //validation of fields for signup
//   void validateSignup() {
//     if (emailController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         usernameController.text.isEmpty ||
//         phonenumberController.text.isEmpty ||
//         confirmPasswordController.text.isEmpty) {
//       return ToastService.showToast(message: "Please fill in all fields");
//     }
//   }

//   //validation of fields for signin
//   void validateSignin() {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       return ToastService.showToast(message: "Please fill in all fields");
//     }
//   }

//   //hide show password
//   void toggleSigninPassword() {
//     if (obscureTextSigninPassword) {
//       obscureTextSigninPassword = false;
//     } else {
//       obscureTextSigninPassword = true;
//     }
//     update();
//   }

//   void toggleSignupPassword() {
//     if (obscureTextSignupPassword) {
//       obscureTextSignupPassword = false;
//     } else {
//       obscureTextSignupPassword = true;
//     }
//     update();
//   }

//   void toggleSignupConfirmPassword() {
//     if (obscureTextSignupConfirmPassword) {
//       obscureTextSignupConfirmPassword = false;
//     } else {
//       obscureTextSignupConfirmPassword = true;
//     }
//     update();
//   }
// }
