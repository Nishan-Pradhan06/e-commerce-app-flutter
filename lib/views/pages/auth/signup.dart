// ignore_for_file: avoid_print

import 'package:e_commercee/views/components/button_widget.dart';
import 'package:e_commercee/views/pages/auth/signin.dart';
import 'package:flutter/material.dart';
import '../../../constant/const.dart';
import '../../components/divider.dart';
import '../../components/text_formfield_widget.dart';
import '../../components/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // final String _password = '';
  bool isPassObsecured=true;
  bool isConfirmPassObsecured=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
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
                  const GetTextWidget(
                    text: 'New Here !',
                    textAlign: TextAlign.start,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: SECONDARY_COLOR,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GetTextWidget(
                    text: 'Please Signup to continue using our app.',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: SECONDARY_COLOR,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidgets(
                    controller: _emailController,
                    hintText: "Email",
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidgets(
                    controller: _passController,
                    hintText: "Password",
                    isObsecuredText: isPassObsecured,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      highlightColor: const Color(0x00ffffff),
                      icon: isPassObsecured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPassObsecured = !isPassObsecured;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidgets(
                    controller: _passController,
                    hintText: "Confirm Password",
                    isObsecuredText: isConfirmPassObsecured,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      highlightColor: const Color(0x00ffffff),
                      icon: isConfirmPassObsecured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isConfirmPassObsecured = !isConfirmPassObsecured;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    text: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DividerWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  SocialAuthButtonWidget(
                    onTap: () {},
                    text: 'Sign Up with Google',
                    image: const AssetImage('assets/icons/google.png'),
                    height: 60,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SocialAuthButtonWidget(
                    onTap: () {},
                    text: 'Sign Up with Facebook',
                    textColor: BACKGOUND_COLOR,
                    image: const AssetImage('assets/icons/facebook.png'),
                    height: 60,
                    color: FACEBOOK_COLOR,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
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
