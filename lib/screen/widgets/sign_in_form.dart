import 'package:alab/common/custom_button.dart';
import 'package:alab/common/custom_text.dart';
import 'package:alab/common/custom_text_field.dart';
import 'package:alab/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: Get.find<AuthController>().signInEmailController,
          hintText: "Enter Email",
        ),
        const SizedBox(height: 20),
        GetBuilder<AuthController>(builder: (controller) {
          return CustomTextField(
            controller: Get.find<AuthController>().signInPasswordController,
            hintText: "Enter Password",
            obscureText: controller.passwordVisibility ? false : true,
            suffixIcon: GestureDetector(
              onTap: () => controller.onChangeVisibility(),
              child: controller.passwordVisibility
                  ? const Icon(
                      Icons.visibility_off,
                      size: 18,
                      color: Colors.orange,
                    )
                  : const Icon(
                      Icons.visibility,
                      size: 18,
                      color: Colors.orange,
                    ),
            ),
          );
        }),
        const SizedBox(height: 30),
        GetBuilder<AuthController>(builder: (controller) {
          return CustomButton(
            loading: controller.loadingState,
            text: "Sign In",
            onTap: () => controller.signIn(),
          );
        }),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 1.5,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomText(text: "OR USE"),
              ),
              Expanded(
                  child: Divider(
                thickness: 1.5,
              ))
            ],
          ),
        ),
        GestureDetector(
          onTap: () async =>
              await Get.find<AuthController>().signInWithGoogle(),
          child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-3, -3),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white70,
                    offset: Offset(3, 3),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Image.asset("assets/icon/google_icon.png")),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Don't have an account?",
              color: Colors.orange,
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
                onTap: () => Get.find<AuthController>().onChangeAuthForm(),
                child: const CustomText(text: "SIGN UP")),
          ],
        )
      ],
    );
  }
}
