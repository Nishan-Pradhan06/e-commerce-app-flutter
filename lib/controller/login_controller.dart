import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../views/pages/screens/home.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> LoginformKey = GlobalKey<FormState>();

  bool isHidden = true;
  bool isSignIn = false;


  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  void tooglePasswordVisibility() {
    isHidden = !isHidden;
    update();
  }

 

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter your Email Address';

    // Regular expression pattern for email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    // Check if the value matches the email pattern
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email Address';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    }

    // Check if password length is at least 8 characters
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check if password contains at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check if password contains at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check if password contains at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Check if password contains at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  Future<void> onSubmitForm(BuildContext context) async {
    if (LoginformKey.currentState?.validate() == false) return;
    isSignIn = true;
    update();
    await Future.delayed(Duration(seconds: 3));
    isSignIn = false;
    update();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }


}
