import 'dart:async';
import 'package:alab/screen/auth_screen.dart';
import 'package:alab/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().first.then((user) {
        if (user != null) {
          Get.offAll(const HomeScreen(),transition: Transition.rightToLeft);
        } else {
          Get.offAll(const AuthScreen(),transition: Transition.rightToLeft);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Center(
            child: Image.asset("assets/images/app_logo.png"),
          ), // Show nothing after 2 seconds
        ),
      ),
    );
  }
}
