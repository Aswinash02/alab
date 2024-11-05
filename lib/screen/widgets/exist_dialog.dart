import 'package:alab/common/custom_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<bool> exitDialog() async {
  bool? exitConfirmed = await Get.dialog<bool>(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      title: Image.asset(
        "assets/images/app_logo.png",
        height: 60,
      ),
      content: const CustomText(
        text: 'Are you sure you want to exit?',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text('Exit'),
        ),
      ],
    ),
  );

  return exitConfirmed ?? false;
}
