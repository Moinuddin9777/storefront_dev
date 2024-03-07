import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(253, 177, 216, 1.0),
        leading: const Icon(
          Icons.home,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
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
                  color: const Color.fromRGBO(253, 177, 216, 1.0),
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
                    text: 'All your ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: 'Favorite Brands',
                    style: TextStyle(
                      color: Color.fromRGBO(218, 136, 182, 1.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' here !!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
