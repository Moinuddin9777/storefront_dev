import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/models/brand_model.dart';
import 'package:storefront/products/controller/search_controller.dart' as MySearchController;

class SearchableDropdownButton extends StatelessWidget {
  SearchableDropdownButton({super.key});
  final TextEditingController textEditingController = TextEditingController();
  final MySearchController.SearchController dropdownController = Get.put(MySearchController.SearchController());

  final BrandModel brandModel = BrandModel();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController.SearchController>( // Change here
      init: dropdownController, // Change here
      builder: (controller) => DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Text(
            'Select Brand',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(163, 255, 255, 255),
            ),
          ),
          items: brandModel.brands
              .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ))
              .toList(),
          value: controller.selectedValue,
          onChanged: (value) {
            controller.setSelectedValue(value!);
          },
          selectedItemBuilder: (BuildContext context) {
            return brandModel.brands.map<Widget>((String item) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList();
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromRGBO(50, 50, 50, 1.0),
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            elevation: 5,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 350,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 26, 26, 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for brand',
                  hintStyle: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(166, 255, 255, 255)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value!
                  .toLowerCase()
                  .contains(searchValue.toLowerCase());
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
