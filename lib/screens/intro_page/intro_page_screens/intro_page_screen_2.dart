import 'package:electro_bikes/screens/intro_page/widget/container.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/text_button.dart';
import 'package:flutter/material.dart';

class IntroPageScreen2 extends StatelessWidget {
  const IntroPageScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 50),
        child: Column(
          children: const [
            Align(
              alignment: Alignment.centerLeft,
              child: MyTextButton(
                data: AppStrings.safety,
                textStyle: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: MyTextButton(
                data: AppStrings.focus,
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: BackgroundContainer(
                imagePath: AppImagesString.securityImage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
