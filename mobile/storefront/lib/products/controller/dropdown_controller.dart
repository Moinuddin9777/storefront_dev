import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  String? selectedValue;
  TextEditingController textEditingController = TextEditingController();

  void setSelectedValue(String value) {
    selectedValue = value;
    update();
  }
}
