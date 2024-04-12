import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commercee/views/pages/admin/admin_pages.dart';
import 'package:e_commercee/views/pages/user/user_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> LoginformKey = GlobalKey<FormState>();

  bool isHidden = true;
  bool isSignIn = false;
  bool isAdmin = false;
  String? error;
  UserModel? user;

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
    if (value == null || value.isEmpty) {
      return 'Please enter your Password';
    }
    return null;
  }

  void onSubmitForm() async {
    if (LoginformKey.currentState?.validate() == false) return;
    isSignIn = true;
    update();
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      // User collection is the reference of collection
      final userCollection = FirebaseFirestore.instance.collection("users");
      final user = await userCollection.doc(userCredential.user!.uid).get();

      this.user = UserModel.fromJson(user.data()!, userCredential.user!.uid);

      this.user?.isAdmin == true
          ? Get.to(
              () => AdminDashboard(),
              transition: Transition.fade,
              duration: Duration(
                seconds: 1,
              ),
            )
          : Get.to(
              () => UserDashboard(),
              transition: Transition.fade,
              duration: Duration(
                seconds: 1,
              ),
            );

      if (isSignIn == true) {
        Fluttertoast.showToast(
          msg: "Login Sucessfull",
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      ///routing
    } on FirebaseAuthException catch (err) {
      debugPrint(err.message.toString());
      if (err.code == "network-request-failed") {
        error = "no internet connection";
        Fluttertoast.showToast(
          msg: error.toString(),
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (err.code == "invalid-credential") {
        error = "useremail or password doesnot match";
        Fluttertoast.showToast(
          msg: error.toString(),
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (err) {
      if (error != null) {
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }

      // debugPrint(err.toString());
    } finally {
      //the login operation is compeleted either it is completed with error or no error
      isSignIn = false;
      update();
    }
  }
}
