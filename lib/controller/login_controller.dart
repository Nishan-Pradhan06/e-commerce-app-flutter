import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState>  formKey = GlobalKey<FormState>();
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
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your Password';
    return null;
  }
}
