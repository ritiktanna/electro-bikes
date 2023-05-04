// ignore_for_file: must_be_immutable

import 'package:country_picker/country_picker.dart';
import 'package:electro_bikes/screens/otp_page/opt_page.dart';
import 'package:electro_bikes/utils/controller_class.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/no_glow_scroll_behavior.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final ControllerClass controllerClass = Get.put(ControllerClass());
  double? fontSize = 12;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        height: Get.height,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ScrollConfiguration(
              behavior: NoGlowScrollBehavior(),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: MyTextWidget(
                      data: AppStrings.loginHere,
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        color: const Color(0xffFAFAFA),
                        border: Border.all(
                          color: const Color(0xffEAEAEA),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (kDebugMode) {
                                print('clicked');
                              }
                              showCountryPicker(
                                context: context,
                                onSelect: (value) {
                                  controllerClass.flag.value = value.flagEmoji;
                                  controllerClass.countryCode.value =
                                      value.phoneCode;
                                  if (kDebugMode) {
                                    print(value.flagEmoji);
                                  }
                                },
                                favorite: <String>['IN'],
                                showPhoneCode: true,
                                countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: Get.height / 1.3,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: Obx(
                                      () => MyTextWidget(
                                        data: controllerClass.flag.value,
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                )
                              ],
                            ),
                          ),
                          Obx(
                            () => MyTextWidget(
                              data: '+${controllerClass.countryCode.value}',
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  controllerClass.phoneNumber.value =
                                      int.parse(value);
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'))
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MyTextWidget(
                      data: AppStrings.verification,
                      textStyle: TextStyle(
                        fontSize: fontSize,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: CommonButton(
                      text: AppStrings.requestOTP,
                      onTap: () {
                        Get.offAll(OTPPage());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextWidget(
                          data: AppStrings.continuing,
                          textStyle: TextStyle(fontSize: fontSize),
                        ),
                        MyTextWidget(
                          data: AppStrings.tAndC,
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                            color: const Color(
                              0xff0059D4,
                            ),
                          ),
                        ),
                      ],
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
