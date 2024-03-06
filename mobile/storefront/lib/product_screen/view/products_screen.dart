import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/product_screen/controller/product_controller.dart';
import 'package:storefront/product_screen/controller/dropdown_controller.dart';
import 'package:storefront/product_screen/view/searchable_dropdown_button.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(ProductController());
    Get.put(DropdownController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        actions: [
          Expanded(child: SearchableDropdownButton()),
          IconButton(
            onPressed: () {
              var brand = Get.find<DropdownController>().selectedValue;
              if (brand != null) {
                ctrl.loadProductsfromBrand(brand);
              }
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'sort') {
                Get.find<ProductController>().sortProductsByPrice();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'sort',
                child: Center(
                  child: Center(
                    child: Text("Sort by price"),
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'filter',
                child: DropdownButton<String>(
                  icon: const Icon(Icons.filter_alt_outlined),
                  items: Get.find<ProductController>()
                      .categories
                      .map(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    Get.find<ProductController>().selecteItem(value!);
                  },
                ),
              ),
            ],
          )
        ],
      ),
      body: GetBuilder(
          init: Get.find<ProductController>(),
          builder: (productController) {
            return productController.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : productController.products.isEmpty
                    ? const Center(
                        child: Text(
                          "No products",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Expanded(
                                      child: ClipRRect(
                                        child: Image.network(
                                          productController
                                              .products[index].imageLink,
                                          errorBuilder:
                                              ((context, error, stackTrace) {
                                            return Image.asset(
                                                'assets/noimage.png');
                                          }),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.40,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.19,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      productController.products[index].name,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Rating: ${productController.products[index].rating}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        Text(
                                          'Price \$${productController.products[index].price}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          );
                        },
                      );
          }),
    );
  }
}
