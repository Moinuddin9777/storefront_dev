// toast_service.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastService {
  static void showToast(
      {required String message,
      Duration duration = const Duration(seconds: 3),
      SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(
      "",
      "",
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.withOpacity(0.8),
      mainButton: TextButton(
        onPressed: () => Get.back(),
        child: const Text("Close", style: TextStyle(color: Colors.black)),
      ),
      duration: duration,
      snackPosition: position,
    );
  }
}
