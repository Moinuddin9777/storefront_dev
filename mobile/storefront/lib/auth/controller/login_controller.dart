import 'package:get/get.dart';

class LoginController extends GetxController {
  bool obscureText = true;

  void toggleHideAndShow() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    update();
  }
}
