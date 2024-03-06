import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:storefront/auth/view/signin_screen.dart';
import 'package:storefront/bottom_bar/view/bottom_bar.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    changeScreen();
  }

  void changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAll(() => const Home());
      } else {
        Get.offAll(() => const SigninScreen());
      }
    });
  }
}
