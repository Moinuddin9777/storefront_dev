import 'package:get/get.dart';

class SearchController extends GetxController {
  String? selectedValue;
  String? selectedBrand;

  void setSelectedValue(String value) {
    selectedValue = value;
    selectedBrand = value;
    update();
  }
}
