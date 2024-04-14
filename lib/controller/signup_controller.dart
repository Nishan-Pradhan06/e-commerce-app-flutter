import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class SignupControllers extends GetxController {
  final TextEditingController SignupemailController = TextEditingController();
  final TextEditingController SignuppassController = TextEditingController();
  final TextEditingController ConfirmpassController = TextEditingController();
  final GlobalKey<FormState> SignupformKey = GlobalKey<FormState>();
  bool isHidden = true;
  bool isConfirmHidden = true;
  bool isSignUp = false;
  String? error;
  UserModel? user;

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

  void onSignupForm() async {
    if (SignupformKey.currentState?.validate() == false) return;
    isSignUp = true;
    update();

    // Delay the update call until after the build process is completed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: SignupemailController.text,
          password: SignuppassController.text,
        );
        // Get a reference to the created user

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'email': SignupemailController.text,
          'name': 'user',
          'isAdmin': 'false',
        });
        // final userCollection = FirebaseFirestore.instance.collection("users");
        // final user = await userCollection.doc(userCredential.user!.uid).set({
        //   'email': SignupemailController.text,

        // });
        // Get.off(() => LoginPage());
        if (isSignUp == true) {
          error = "Signup Sucessfull";
          Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } on FirebaseAuthException catch (err) {
        debugPrint(err.message.toString());
        if (err.code == 'weak-password') {
          error = "The password provided is too weak.";
          Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (err.code == 'email-already-in-use') {
          error = "The account already exists for that email.";
          Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          error = 'Error occurred while signing up.';
          Fluttertoast.showToast(
            msg: error.toString(),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } catch (e) {
        Fluttertoast.showToast(
          msg: e.toString(), // <- Fixed typo here, was `error.toString()`
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        isSignUp = false;
        update();
      }
    });
  }
}
