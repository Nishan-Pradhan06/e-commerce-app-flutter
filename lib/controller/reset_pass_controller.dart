import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/auth/password_reset/otp_page.dart';
import '../views/pages/auth/password_reset/reset_password.dart';

class ResetPassword extends GetxController {
  final TextEditingController email_reset_controller = TextEditingController();
  final TextEditingController resetController = TextEditingController();
  final TextEditingController confirmResetController = TextEditingController();
  final GlobalKey<FormState> VerifyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> ResetPasswordGlobalKey = GlobalKey<FormState>();

  bool isSending = false;
  bool isHidden = true;
  bool isConfirmHidden = true;

  @override
  void onClose() {
    email_reset_controller.dispose();
    resetController.dispose();
    confirmResetController.dispose();
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
    if (value != resetController.text) {
      return "Password do'nt Match";
    }
    return null;
  }

  void onSentEmail() {
    if (VerifyEmail.currentState?.validate() == false) return;
    isSending = true;
    update();
    Get.to(() => OTP_page());
  }

  void onPassRest() {
    Get.back();
  }

  void onOTPReceived() {
    Get.to(() => PasswordReset());
  }
}
