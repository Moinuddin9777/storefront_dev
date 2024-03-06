import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/home_screen/view/searchable_dropdown_button.dart';
<<<<<<< HEAD
import 'package:storefront/products/view/products_list_screen.dart';
=======
import 'package:storefront/products/view/products_page.dart';
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
//import 'package:storefront/home/controller/dropdown_controller.dart';

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
                    text: 'Favorite Brand',
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

          // Dropdown button
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SearchableDropdownButton(),
                  ),
                ),
                //search icon
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GestureDetector(
                    onTap: () {
                      //dropdownController.handleSearchIconClick();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(25),
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
<<<<<<< HEAD
                          Get.to(const ProductsList());
                        },
                        icon: Icon(
=======
                          Get.to(const ProductsPage());
                        },
                        icon: const Icon(
>>>>>>> 02cda3d4b178def79735c2c8d606ab274afe1d5f
                          Icons.search,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
