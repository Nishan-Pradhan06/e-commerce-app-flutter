// ignore_for_file: avoid_print

import 'package:e_commercee/views/components/button_widget.dart';
import 'package:flutter/material.dart';
import '../../../constant/const.dart';
import '../../components/divider.dart';
import '../../components/text_formfield_widget.dart';
import '../../components/text_widget.dart';
import 'signup.dart';
import '../screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // final String _password = '';

  @override
  Widget build(BuildContext context) {
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
                  const GetTextWidget(
                    text: 'Welcome Back !',
                    textAlign: TextAlign.start,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: SECONDARY_COLOR,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GetTextWidget(
                    text: 'Please login to continue using our app.',
                    textAlign: TextAlign.start,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: SECONDARY_COLOR,
                  ),
                  const SizedBox(
                    height: 40,
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
                    height: 20,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormFieldWidgets(
                    controller: _passController,
                    hintText: "Password",
                    isObsecuredText: true,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: const Icon(Icons.visibility),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    text: 'Log in',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DividerWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  SocialAuthButtonWidget(
                    onTap: () {},
                    text: 'Continue with Google',
                    image: const AssetImage('assets/icons/google.png'),
                    height: 60,
                    borderColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SocialAuthButtonWidget(
                    onTap: () {},
                    text: 'Continue with Facebook',
                    textColor: BACKGOUND_COLOR,
                    image: const AssetImage('assets/icons/facebook.png'),
                    height: 60,
                    color: FACEBOOK_COLOR,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
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
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
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
