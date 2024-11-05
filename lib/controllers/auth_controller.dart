import 'package:alab/common/custom_snackbar.dart';
import 'package:alab/screen/auth_screen.dart';
import 'package:alab/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool _isSignIn = true;
  bool _passwordVisibility = false;
  bool _loadingState = false;
  bool _googleSignInLoadingState = false;

  bool get isSignIn => _isSignIn;

  bool get loadingState => _loadingState;

  bool get googleSignInLoadingState => _googleSignInLoadingState;

  bool get passwordVisibility => _passwordVisibility;

  final FirebaseAuth auth = FirebaseAuth.instance;

  // sign in
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  // sign up
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  onChangeAuthForm() {
    _isSignIn = !_isSignIn;
    update();
  }

  onChangeVisibility() {
    _passwordVisibility = !_passwordVisibility;
    update();
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive'])
              .signIn();

      if (googleUser == null) {
        return;
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null && googleAuth.idToken == null) {
        return;
      }
      _googleSignInLoadingState = true;
      update();
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAll(const HomeScreen(), transition: Transition.rightToLeft);
      customSnackBar("Signed in successfully", isError: false);
    } on FirebaseAuthException catch (_) {
      customSnackBar("Authentication failed. Please try again.");
    } catch (_) {
      customSnackBar(
          "An error occurred during Google sign-in. Please try again.");
    }
    _googleSignInLoadingState = false;
    update();
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      Get.offAll(const AuthScreen(), transition: Transition.rightToLeft);
      customSnackBar("Signed out successfully", isError: false);
    } catch (e) {
      customSnackBar("Failed to sign out. Please try again.");
    }
  }

  Future<void> signUp() async {
    if (nameController.text.isEmpty) {
      customSnackBar("Please Enter Name");
    } else if (emailController.text.isEmpty) {
      customSnackBar("Please Enter Email");
    } else if (!GetUtils.isEmail(emailController.text)) {
      customSnackBar("Please Enter Valid Email");
    } else if (passwordController.text.isEmpty) {
      customSnackBar("Please Enter Password");
    } else if (passwordController.text.length < 8) {
      customSnackBar("Password length must have 8 characters");
    } else if (confirmPasswordController.text.isEmpty) {
      customSnackBar("Please Enter Confirm Password");
    } else if (passwordController.text != confirmPasswordController.text) {
      customSnackBar("Password and Confirm Password do not match");
    } else {
      _loadingState = true;
      update();

      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await userCredential.user
            ?.updateProfile(displayName: nameController.text);

        clearController();
        customSnackBar("Sign Up Successfully", isError: false);
        Get.offAll(const HomeScreen(), transition: Transition.rightToLeft);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'email-already-in-use':
            customSnackBar("This email is already registered. Try logging in.");
            break;
          case 'invalid-email':
            customSnackBar("The email address is not valid.");
            break;
          default:
            customSnackBar("An unexpected error occurred. Please try again.");
        }
      } catch (e) {
        customSnackBar("Something went wrong. Please try again later.");
      }
    }
    _loadingState = false;
    update();
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
    signInEmailController.clear();
    signInPasswordController.clear();
  }

  Future<void> signIn() async {
    if (signInEmailController.text.isEmpty) {
      customSnackBar("Please Enter email");
    } else if (!GetUtils.isEmail(signInEmailController.text)) {
      customSnackBar("Please Enter Valid Email");
    } else if (signInPasswordController.text.isEmpty) {
      customSnackBar("Please Enter password");
    } else if (signInPasswordController.text.length < 8) {
      customSnackBar("Password length must have 8 character");
    } else {
      _loadingState = true;
      update();
      try {
        await auth.signInWithEmailAndPassword(
          email: signInEmailController.text,
          password: signInPasswordController.text,
        );
        clearController();
        customSnackBar('Sign in successfully', isError: false);
        Get.offAll(const HomeScreen(), transition: Transition.rightToLeft);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            customSnackBar(
                "No user found with this email. Please sign up first.");
            break;
          case 'invalid-credential':
            customSnackBar("Incorrect password. Please try again.");
            break;
          case 'invalid-email':
            customSnackBar("The email address is not valid.");
            break;
          default:
            customSnackBar("An unexpected error occurred. Please try again.");
        }
      } catch (_) {
        customSnackBar("Something went wrong. Please try again later.");
      }
    }
    _loadingState = false;
    update();
  }
}
