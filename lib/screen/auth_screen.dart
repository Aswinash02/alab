import 'package:alab/common/custom_text.dart';
import 'package:alab/controllers/auth_controller.dart';
import 'package:alab/screen/widgets/sign_in_form.dart';
import 'package:alab/screen/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.grey[300],
            body: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset("assets/images/app_logo.png")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GetBuilder<AuthController>(builder: (controller) {
                            return GestureDetector(
                              onTap: () => controller.onChangeAuthForm(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CustomText(
                                  text: "Sign In",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: controller.isSignIn
                                      ? Colors.orange
                                      : Colors.black,
                                ),
                              ),
                            );
                          }),
                          Container(
                            height: 20,
                            width: 2,
                            color: Colors.black,
                          ),
                          GetBuilder<AuthController>(builder: (controller) {
                            return GestureDetector(
                              onTap: () => controller.onChangeAuthForm(),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: CustomText(
                                  text: "Sign Up",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: controller.isSignIn
                                      ? Colors.black
                                      : Colors.orange,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 15),
                      GetBuilder<AuthController>(builder: (controller) {
                        return controller.isSignIn
                            ? const SignInForm()
                            : const SignUpForm();
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (controller.googleSignInLoadingState)
            Container(
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              ),
            ),
        ],
      );
    });
  }
}
