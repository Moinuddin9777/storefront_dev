import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storefront/logout/view/logoutbutton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Image.asset("assets/profile_img.png"),
            ),
          ),
          Center(
            child: Text(
              FirebaseAuth.instance.currentUser!.email!.split("@")[0],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const LogoutButton(),
        ],
      ),
    );
  }
}
