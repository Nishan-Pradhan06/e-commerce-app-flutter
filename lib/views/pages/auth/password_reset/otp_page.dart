import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../constant/const.dart';
import '../../../../controller/auth/reset_pass_controller.dart';
import '../../../components/button_widget.dart';
import '../../../components/text_widget.dart';

class OTP_page extends StatelessWidget {
  OTP_page({super.key});
  final ResetPassword _otp = Get.put(ResetPassword());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const GetTextWidget(
                text: 'Enter Your OTP',
                textAlign: TextAlign.center,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: SECONDARY_COLOR,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        } else {
                          if (index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Resent in'),
                SizedBox(
                  width: 10,
                ),
                Text('20 Sec'),
              ],
            ),
            SizedBox(height: 20),
            GetBuilder<ResetPassword>(
              init: _otp,
              builder: (controller) {
                return ButtonWidget(
                  onPressed: controller.isOTPReceived
                      ? null
                      : controller.onOTPReceived,
                  text: controller.isOTPReceived ? "Please Wait" : 'Submit',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
