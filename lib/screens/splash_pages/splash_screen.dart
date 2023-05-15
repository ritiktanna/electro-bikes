import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../intro_page/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    introPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(
                AppImagesString.electroBikeAppLogo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 60,
              ),
              child: Image.asset(
                AppImagesString.electroBikeAppTextLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> introPage() async {
    await Future<Widget>.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    Get.to<Widget>(() => const IntroPage());
  }
}
