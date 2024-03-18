import 'package:flutter/material.dart';
import 'package:learining/contrast/const.dart';
import 'login_page.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgMethod(),
          const SizedBox(
            height: 26,
          ),
          titleMethod(),
          const SizedBox(
            height: 26,
          ),
          textMethod(),
          const SizedBox(
            height: 26,
          ),
          buttonMethod(context),
          const SizedBox(
            height: 26,
          ),
        ],
      ),
    );
  }

  Text titleMethod() {
    return const Text(
      'Welcome',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: SECONDARY_COLOR,
      ),
    );
  }

  Padding textMethod() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        'Create an account to access thousands of cools books.',
        textAlign: TextAlign.center,
        style: TextStyle(color: SECONDARY_COLOR, fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding buttonMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: PRIMARY_COLOR,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding imgMethod() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Image.asset(
        'assets/get.jpg',
        height: 300,
      ),
    );
  }
}
