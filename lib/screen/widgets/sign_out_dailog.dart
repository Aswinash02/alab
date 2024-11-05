import 'package:alab/common/custom_text.dart';
import 'package:alab/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void signOutDialog() {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      title: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              height: 60,
            ),
            const SizedBox(height: 16),
            const CustomText(
              text: "Are you sure you want to sign out?",
              fontSize: 18,
              maxLines: 2,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const CustomText(text: "Cancel", color: Colors.blue),
        ),
        TextButton(
          onPressed: () {
            Get.find<AuthController>().signOut();
            Get.back();
          },
          child: const CustomText(text: "Sign Out", color: Colors.red),
        ),
      ],
    ),
  );
}
