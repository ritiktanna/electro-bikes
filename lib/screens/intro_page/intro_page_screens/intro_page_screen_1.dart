import 'package:electro_bikes/screens/intro_page/widget/container.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/text_button.dart';
import 'package:flutter/material.dart';

class IntroPageScreen1 extends StatelessWidget {
  const IntroPageScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 25),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: MyTextButton(
                onTap: () {
                  startingScreen(context);
                },
                data: AppStrings.skip,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: MyTextButton(
                data: AppStrings.navigation,
                textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: MyTextButton(
                data: AppStrings.searchAndLocate,
                textStyle: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 150),
                child:
                    BackgroundContainer(imagePath: AppImagesString.mapImage)),
          ],
        ),
      ),
    );
  }

  void startingScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/intro-page', (route) => false);
  }
}
