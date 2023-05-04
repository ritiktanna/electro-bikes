import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/controller_class.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_strings.dart';
import '../../widget/electro_bike_text_logo.dart';

class OTPPage extends StatelessWidget {
  OTPPage({Key? key}) : super(key: key);
  final ControllerClass controllerClass = Get.put(ControllerClass());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0).copyWith(top: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        const Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: ElectroBikeTextLogo()),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      AppImagesString.otpPageVector,
                    ),
                  ),
                  const MyTextWidget(
                    data: AppStrings.codeVerificationText,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: MyTextWidget(
                      data:
                          '+${controllerClass.countryCode.value}*******${controllerClass.phoneNumber.value.toString().substring(7, 10)}',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Pinput(
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(234, 239, 243, 1),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        MyTextWidget(data: AppStrings.didNot),
                        MyTextWidget(
                          data: AppStrings.sendAgain,
                          textStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 30),
                    child: CommonButton(
                      text: AppStrings.verifyAndProceed,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
