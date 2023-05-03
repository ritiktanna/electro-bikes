import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: MyTextWidget(
                  data: AppStrings.loginHere,
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(AppImagesString.loginPageVector),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyTextWidget(
                  data: AppStrings.enterNumber,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  border: Border.all(
                    color: const Color(0xffEAEAEA),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IntlPhoneField(decoration: InputDecoration()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
