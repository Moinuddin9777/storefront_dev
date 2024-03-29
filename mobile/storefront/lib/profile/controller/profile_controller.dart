import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  QueryDocumentSnapshot<dynamic>? user;
  @override
  onInit() async {
    super.onInit();
    user = await getUser();
    update();
  }

  Future<QueryDocumentSnapshot<dynamic>> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: user!.uid)
        .get();
    return data.docs[0];
  }

  void updateProfile() async {
    User? users = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection("users").doc(users!.uid).set({
      "username": usernameController.text,
      "phonenumber": phoneController.text,
    }, SetOptions(merge: true));
    user = await getUser();
    update();
  }
}
