import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/pages/auth/otp_page.dart';

class Select_email extends GetxController {
  final TextEditingController email_reset_controller = TextEditingController();
  final GlobalKey<FormState> reset_global_key = GlobalKey<FormState>();

  bool isSending = false;

  @override
  void onClose() {
    email_reset_controller.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty)
      return 'Please enter your Email Address';
    return null;
  }

  void onSentEmail() {
    if (reset_global_key.currentState?.validate() == false) return;
    isSending = true;
    update();
    Get.to(() => OTP_page());
  }
}
