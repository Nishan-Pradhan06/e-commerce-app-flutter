import 'package:e_commercee/views/pages/admin/admin_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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

  void onSubmitForm() async {
    if (LoginformKey.currentState?.validate() == false) return;
    isSignIn = true;
    update();
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      Get.to(() => AdminDashboard(),
          transition: Transition.fade,
          duration: Duration(
            seconds: 1,
          ));
      Fluttertoast.showToast(
        msg: "Login Sucessfully",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      ///routing
    } on FirebaseAuthException catch (err) {
      debugPrint(err.message.toString());
      //catch only firebaseAuthException as specified
      // Get.showSnackbar(GetSnackBar(
      //   title: "Firebase Exception",
      //   messageText: Text(err.message ?? "Login Error"),
      //   borderRadius: 10.0,
      //   backgroundColor: Colors.grey,
      //   duration: Duration(seconds: 5),
      //   animationDuration: Duration(milliseconds: 200),
      //   margin: EdgeInsets.all(10),
      // ));
      Fluttertoast.showToast(
        msg: "Login Failed",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (err) {
      Fluttertoast.showToast(
        msg: err.toString() ?? "Some thing Went Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      debugPrint(err.toString());
    } finally {
      //the login operation is compeleted either it is completed with error or no error
      isSignIn = false;
      update();
    }
  }
}
