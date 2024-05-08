// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/const.dart';
import '../../../controller/auth/login_controller.dart';
import '../../components/button_widget.dart';
import '../../components/custonButton.dart';
import '../../components/divider.dart';
import '../../components/text_formfield_widget.dart';
import '../../components/text_widget.dart';
import '../admin/admin_home.dart';
import '../user/user_pages.dart';
import 'password_reset/verify_email.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: GetBuilder<LoginController>(
            init: _loginController,
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 5, left: 40, right: 40),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _loginController.LoginformKey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics:
                        const ScrollPhysics(parent: BouncingScrollPhysics()),
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
                          GetBuilder<LoginController>(
                              init: LoginController(),
                              builder: (LoginController controller) {
                                return TextFormFieldWidgets(
                                  validator: (value) {
                                    return controller.validateEmail(value);
                                  },
                                  controller: _loginController.emailController,
                                  hintText: "Email",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (LoginController controller) {
                              return TextFormFieldWidgets(
                                validator: (value) {
                                  return controller.validatePassword(value);
                                },
                                controller: _loginController.passController,
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
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => ForgetPassPage());
                              },
                              child: const Text(
                                "Forget Password ?",
                                style: TextStyle(
                                  color: PRIMARY_COLOR,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomElevatedButton(
                            onPressed: _loginController.isSignIn
                                ? null
                                : _loginController.onSubmitForm,
                            isLoading: _loginController.isSignIn,
                            buttonText: 'Log in',
                            buttonColor: _loginController.isSignIn
                                ? Colors.grey
                                : const Color(0xff1c903c),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const DividerWidget(),
                          const SizedBox(
                            height: 20,
                          ),
                          SocialAuthButtonWidget(
                            onTap: () {
                              Get.to(
                                () => AdminHome(),
                                transition: Transition.fade,
                                duration: Duration(
                                  seconds: 1,
                                ),
                              );
                            },
                            text: 'Continue with Google',
                            image: const AssetImage('assets/icons/google.png'),
                            height: 60,
                            borderColor: Colors.grey,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SocialAuthButtonWidget(
                            onTap: () {
                              Get.to(() => UserDashboard(),
                                  transition: Transition.fade,
                                  duration: Duration(
                                    seconds: 1,
                                  ));
                            },
                            text: 'Continue with Facebook',
                            textColor: BACKGOUND_COLOR,
                            image:
                                const AssetImage('assets/icons/facebook.png'),
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
                                Get.to(
                                  () => SignUp(),
                                  transition: Transition.fade,
                                  duration: Duration(
                                    seconds: 1,
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
              );
            }),
      ),
    );
  }
}
