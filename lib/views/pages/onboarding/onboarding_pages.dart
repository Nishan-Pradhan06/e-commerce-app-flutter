import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'getting_start.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key, this.title});
  final String? title;
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        showBullets: true,
        inactiveBulletColor: Colors.purple.shade100,
        skipCallback: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const GettingStart()),
            ),
          );
        },
        finishCallback: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const GettingStart()),
            ),
          );
        },
      ),
    );
  }
}

final pages = [
  PageModel(
      color: const Color(0xFF0097A7),
      imageAssetPath: 'assets/onboarding/ecom.png',
      title: 'Discover New Products',
      body: 'Explore and share your favorite products with your team.',
      doAnimateImage: true),
  PageModel(
      color: const Color(0xFF536DFE),
      imageAssetPath: 'assets/onboarding/img4.png',
      title: 'Boost Your Sales',
      body: 'Witness a surge in sales and productivity with our platform.',
      doAnimateImage: true),
  PageModel(
      color: const Color(0xFF9B90BC),
      imageAssetPath: 'assets/onboarding/img.png',
      title: 'Global Connections',
      body: 'Connect with customers and sellers worldwide effortlessly.',
      doAnimateImage: true),
  PageModel(
    color: const Color(0xFF5886d6),
    imageAssetPath: 'assets/onboarding/transcation.png',
    title: 'Secure Transactions',
    body:
        'Ensure Safe and Secure Transactions\nProtect Your Customers and Your Business.',
    doAnimateImage: true,
  ),
];
