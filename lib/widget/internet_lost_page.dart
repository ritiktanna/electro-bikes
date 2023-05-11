import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:flutter/material.dart';

import '../utils/app_image_string.dart';

class InternetLostPage extends StatelessWidget {
  const InternetLostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppImagesString.lostInternet), context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImagesString.lostInternet,
                scale: 30,
              ),
              const FittedBox(
                child: MyTextWidget(
                  data: AppStrings.noInternet,
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const FittedBox(
                child: MyTextWidget(
                  textAlign: TextAlign.center,
                  data: AppStrings.noInternetSubTitle,
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: CommonButton(
                  text: AppStrings.retry,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
