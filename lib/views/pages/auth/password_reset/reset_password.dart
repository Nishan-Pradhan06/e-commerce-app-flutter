// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constant/const.dart';
import '../../../../controller/reset_pass_controller.dart';
import '../../../components/button_widget.dart';
import '../../../components/text_formfield_widget.dart';
import '../../../components/text_widget.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset({super.key});
  final ResetPassword _resetPassword = Get.put(ResetPassword());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGOUND_COLOR,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 5, left: 40, right: 40),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _resetPassword.ResetPasswordGlobalKey,
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
                        text: 'Reset Password',
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
                        text: 'Enter the New Password',
                        textAlign: TextAlign.center,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: SECONDARY_COLOR,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // const Text(
                    //   '',
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    GetBuilder<ResetPassword>(
                      init: ResetPassword(),
                      builder: (ResetPassword controller) {
                        return TextFormFieldWidgets(
                          validator: (value) {
                            return controller.validatePassword(value);
                          },
                          controller: controller.resetController,
                          hintText: "New Password",
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
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<ResetPassword>(
                        init: ResetPassword(),
                        builder: (ResetPassword controller) {
                          return TextFormFieldWidgets(
                            validator: (value) {
                              return controller.validatePassword(value);
                            },
                            controller: controller.confirmResetController,
                            hintText: "Confirm Password",
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
                                controller.confirmtoggleVisibility();
                              },
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<ResetPassword>(
                        init: _resetPassword,
                        builder: (controller) {
                          return ButtonWidget(
                            onPressed: controller.onPassRest,
                            text: 'Send Code',
                          );
                        }),

                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
