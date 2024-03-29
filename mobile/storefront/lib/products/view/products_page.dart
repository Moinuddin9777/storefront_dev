import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/controller/api_integration.dart';
import 'package:storefront/products/view/searchable_dropdown_button.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (productController) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              TextButton(onPressed: () {}, child: const Text('Sort')),
              TextButton(onPressed: () {}, child: const Text('Filters')),
            ],
          ),
          body: _buildBody(productController),
        );
      },
    );
  }

  Widget _buildBody(ProductController productController) {
    if (productController.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (productController.products.isEmpty) {
        return Center(child: Text('No products available'));
      } else {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            return GridTile(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            child: Image.network(
                              productController.products[index].imageLink,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/noimage.png');
                              },
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: MediaQuery.of(context).size.height * 0.19,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          productController.products[index].name,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }
    }
  }
}
