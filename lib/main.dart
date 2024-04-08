import 'package:e_commercee/constant/const.dart';
import 'package:e_commercee/views/pages/onboarding/onboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'views/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ambey Enterprise',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: PRIMARY_COLOR),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}
