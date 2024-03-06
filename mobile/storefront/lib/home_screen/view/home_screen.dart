import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/products/view/products_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(25.0), // Add rounded corners to the app bar
        ),
        leading: Icon(
          Icons.home,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        centerTitle: true,
        title: Text(
          'Home Page',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          //image or design element
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4),
                    Theme.of(context).colorScheme.primary.withOpacity(0.6)
                  ]),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/makeupImage.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          //Select your favourite brand text
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 35),
                children: [
                  TextSpan(
                    text: 'Select your ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  TextSpan(
                    text: 'Favorite Brands',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  TextSpan(
                    text: ' here !!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),

          // go to products
          ElevatedButton(
              onPressed: () {
              Get.to(() => ProductsPage());
            }, child: const Text('Go to Products page'),),
        ],
      ),
    );
  }
}
