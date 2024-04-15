import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../controller/reset_pass_controller.dart';

class OTP_page extends StatelessWidget {
  OTP_page({super.key});
  final ResetPassword _otp = Get.put(ResetPassword());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            GetBuilder<ResetPassword>(
                init: _otp,
                builder: (controller) {
                  return ElevatedButton(
                    onPressed: controller.onOTPReceived,
                    child: Text('Submit'),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
