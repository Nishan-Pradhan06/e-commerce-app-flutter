import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/auth/password_reset/otp_page.dart';
import '../views/pages/auth/password_reset/reset_password.dart';

class ResetPassword extends GetxController {
  final TextEditingController emailpass_reset_controller =
      TextEditingController();
  final TextEditingController resetController = TextEditingController();
  final TextEditingController confirmResetController = TextEditingController();
  final GlobalKey<FormState> VerifyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> ResetPasswordGlobalKey = GlobalKey<FormState>();

  bool isSending = false;
  bool isHidden = true;
  bool isConfirmHidden = true;
  bool isOTPReceived = false;

  @override
  void onClose() {
    emailpass_reset_controller.dispose();
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
    if (value != resetController.text) {
      return "Password do'nt Match";
    }
    return null;
  }

  void onSentEmail(BuildContext context) async {
    if (VerifyEmail.currentState?.validate() == false) return;
    isSending = true;
    update();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailpass_reset_controller.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            width: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return CircularProgressIndicator();
          });
    }

    Get.to(
      () => OTP_page(),
      transition: Transition.fade,
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  void onPassRest() {
    Get.back();
  }

  void onOTPReceived() {
    Get.to(
      () => PasswordReset(),
      transition: Transition.fade,
      duration: Duration(
        seconds: 1,
      ),
    );
  }
}
