// ignore_for_file: avoid_print, must_be_immutable

import 'package:e_commercee/controller/reset_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/const.dart';
import '../../../components/button_widget.dart';
import '../../../components/text_formfield_widget.dart';
import '../../../components/text_widget.dart';

class ForgetPassPage extends StatelessWidget {
  ForgetPassPage({super.key});
  final ResetPassword _select_email = Get.put(ResetPassword());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: GetBuilder<ResetPassword>(builder: (controller) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 5, left: 40, right: 40),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _select_email.VerifyEmail,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: const GetTextWidget(
                          text: 'Forget Password',
                          textAlign: TextAlign.center,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: SECONDARY_COLOR,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: const GetTextWidget(
                          text:
                              'Enter Email address to send the code to reset the password',
                          textAlign: TextAlign.center,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: SECONDARY_COLOR,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<ResetPassword>(
                          init: ResetPassword(),
                          builder: (ResetPassword controller) {
                            return TextFormFieldWidgets(
                              controller: controller.email_reset_controller,
                              validator: (value) {
                                return controller.validateEmail(value);
                              },
                              hintText: "Email",
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<ResetPassword>(
                          init: _select_email,
                          builder: (controller) {
                            return ButtonWidget(
                              onPressed: controller.onSentEmail,
                              text: controller.isSending
                                  ? 'Please wait'
                                  : 'Send Code',
                            );
                          }),
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
        }),
      ),
    );
  }
}
