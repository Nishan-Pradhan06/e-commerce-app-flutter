// ignore_for_file: avoid_print, must_be_immutable


import 'package:flutter/material.dart';
import '../../../constant/const.dart';
import '../../components/button_widget.dart';
import '../../components/text_formfield_widget.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _forgetPass = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 5, left: 40, right: 40),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidgets(
                    // validator: (value) {
                    //   return null;
                    //   // return controller.validateEmail(value);
                    // },
                    controller: _forgetPass,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      // if (!controller.isSignIn) {
                      //   _loginController.onSubmitForm(context);
                      // }
                      // print("clicked");
                    },
                    text: 'Send Code',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Go Back To",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
