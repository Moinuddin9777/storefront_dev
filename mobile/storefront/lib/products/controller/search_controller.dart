import 'package:get/get.dart';

class SearchController extends GetxController {
  String? selectedValue;
  String? selectedBrand;

  void setSelectedValue(String value) {
    selectedValue = value;
    selectedBrand = value;
    update();
  }

  // void handleSearchIconClick() {
  //   if (selectedValue != null && selectedValue!.isNotEmpty) {
  //     String selectedBrand = selectedValue!;

  // Clear the existing ProductController instance
  //Get.delete<ProductController>();

  // Initialize ProductController with the selected brand
  //Get.put(ProductController(selectedBrand));

  // Navigate to ProductsPage with the selected brand
  //Get.to(() => ProductsPage(selectedBrand: selectedBrand));
  // } else {
  // Show an alert or snackbar indicating that a brand must be selected
  // You can use Get.snackbar or showDialog for this purpose
  //   }
  // }
}
