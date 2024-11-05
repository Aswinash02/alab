import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(String? message, {bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Center(
            child: Text(message, style: const TextStyle(color: Colors.white))),
      ),
    ));
  }
}
