// ignore_for_file: avoid_print

import 'package:e_commercee/views/components/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/const.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../components/divider.dart';
import '../../components/text_formfield_widget.dart';
import '../../components/text_widget.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final SignupControllers _signupController = Get.put(SignupControllers());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: GetBuilder(
          init: _signupController,
          builder: (controller) {
            return controller.isSignUp
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      key: _signupController.SignupformKey,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(
                            parent: BouncingScrollPhysics()),
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
                                text:
                                    'Please Signup to continue using our app.',
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
                              GetBuilder<SignupControllers>(
                                  init: SignupControllers(),
                                  builder: (SignupControllers controller) {
                                    return TextFormFieldWidgets(
                                      validator: (value) {
                                        return controller.validateEmail(value);
                                      },
                                      controller: _signupController
                                          .SignupemailController,
                                      hintText: "Email",
                                      prefixIcon: const Icon(
                                        Icons.email,
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GetBuilder<SignupControllers>(
                                  init: SignupControllers(),
                                  builder: (SignupControllers controller) {
                                    return TextFormFieldWidgets(
                                      validator: (value) {
                                        return controller
                                            .validatePassword(value);
                                      },
                                      controller: _signupController
                                          .SignuppassController,
                                      hintText: "Password",
                                      isObsecuredText: controller.isHidden,
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        highlightColor: const Color(0x00ffffff),
                                        icon: controller.isHidden == true
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                        onPressed: () {
                                          controller.tooglePasswordVisibility();
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Confirm Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GetBuilder<SignupControllers>(
                                  init: SignupControllers(),
                                  builder: (SignupControllers controller) {
                                    return TextFormFieldWidgets(
                                      validator: (value) {
                                        return controller
                                            .validatePassword(value);
                                      },
                                      controller: _signupController
                                          .ConfirmpassController,
                                      hintText: "Confirm Password",
                                      isObsecuredText:
                                          controller.isConfirmHidden,
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        highlightColor: const Color(0x00ffffff),
                                        icon: controller.isConfirmHidden == true
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off),
                                        onPressed: () {
                                          controller.confirmtoggleVisibility();
                                        },
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              GetBuilder<SignupControllers>(
                                  init: _signupController,
                                  builder: (controller) {
                                    return ButtonWidget(
                                      onPressed: controller.isSignUp
                                          ? null
                                          : () => controller.onSignupForm(),
                                      text: controller.isSignUp
                                          ? 'Please wait'
                                          : 'Sign Up',
                                    );
                                  }),
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
                                image:
                                    const AssetImage('assets/icons/google.png'),
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
                                image: const AssetImage(
                                    'assets/icons/facebook.png'),
                                height: 60,
                                color: FACEBOOK_COLOR,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
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
                                    Get.back();
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
                  );
          },
        ),
      ),
    );
  }
}
