import 'package:e_commercee/views/components/button_widget.dart';
import 'package:flutter/material.dart';
import '../../components/text_widget.dart';
import '../auth/signin.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imgMethod(),
            const SizedBox(
              height: 26,
            ),
            const GetTextWidget(
              text: 'Welcome',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              //
            ),
            const SizedBox(
              height: 26,
            ),
            const GetTextWidget(
              text: 'Create an account to access thousands of cools books.',
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonWidget(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              text: 'Get Started',
            )
          ],
        ),
      ),
    );
  }

  Padding imgMethod() {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Image.asset(
        'assets/onboarding/get.png',
        height: 300,
      ),
    );
  }
}
