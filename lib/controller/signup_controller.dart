import 'package:e_commercee/views/pages/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SignupControllers extends GetxController {
  final TextEditingController SignupemailController = TextEditingController();
  final TextEditingController SignuppassController = TextEditingController();
  final TextEditingController ConfirmpassController = TextEditingController();
  final GlobalKey<FormState> SignupformKey = GlobalKey<FormState>();
  bool isHidden = true;
  bool isConfirmHidden = true;
  bool isSignUp = false;

  @override
  void onClose() {
    SignupemailController.dispose();
    SignuppassController.dispose();
    ConfirmpassController.dispose();
    super.onClose();
  }

  void tooglePasswordVisibility() {
    isHidden = !isHidden;
    update();
  }

  void confirmtoggleVisibility() {
    isConfirmHidden = !isConfirmHidden;
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
    if (value != SignuppassController.text) {
      return "Password do'nt Match";
    }

    return null;
  }

  onSignupForm(BuildContext context) {
    if (SignupformKey.currentState?.validate() == false) return;
    isSignUp = true;
    update();
    Future.delayed(Duration(seconds: 2));
    isSignUp = false;
    update();
    Navigator.of(context).pop();
  }
}
