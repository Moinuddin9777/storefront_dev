import 'package:get/get.dart';
import 'package:storefront/theme/models/theme.dart';

class ThemeController extends GetxController {
  int index = 0;
  final themes = [
    AppThemes.darkTheme,
    AppThemes.lightTheme,
  ];

  void changeTheme() {
    index = (index + 1) % (themes.length);
    Get.changeTheme(themes[index]);
    update();
  }
}
