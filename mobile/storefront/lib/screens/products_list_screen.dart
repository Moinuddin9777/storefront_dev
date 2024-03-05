import 'package:flutter/material.dart';
import 'package:storefront/widgets/products_list.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final String brand = 'colourpop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 89, 171, 238),
          title: Text(brand.toUpperCase()),
        ),
        body: ProductsListView(brand: brand));
  }
}
