import 'package:alab/common/custom_button.dart';
import 'package:alab/common/custom_text.dart';
import 'package:alab/common/custom_text_field.dart';
import 'package:alab/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: Get.find<AuthController>().nameController,
          hintText: "Enter Name",
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: Get.find<AuthController>().emailController,
          hintText: "Enter Email",
        ),
        const SizedBox(height: 20),
        GetBuilder<AuthController>(builder: (controller) {
          return CustomTextField(
            controller: Get.find<AuthController>().passwordController,
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
        const SizedBox(height: 20),
        GetBuilder<AuthController>(builder: (controller) {
          return CustomTextField(
            controller: Get.find<AuthController>().confirmPasswordController,
            hintText: "Enter Confirm Password",
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
            text: 'Sign Up',
            onTap: () => controller.signUp(),
          );
        }),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Already have an account?",
              color: Colors.orange,
            ),
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
                onTap: () => Get.find<AuthController>().onChangeAuthForm(),
                child: const CustomText(text: "SIGN IN")),
          ],
        )
      ],
    );
  }
}
