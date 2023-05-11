// ignore_for_file: must_be_immutable

import 'package:country_picker/country_picker.dart';
import 'package:electro_bikes/bloc/internet_bloc/internet_bloc.dart';
import 'package:electro_bikes/bloc/internet_bloc/internet_state.dart';
import 'package:electro_bikes/screens/otp_page/opt_page.dart';
import 'package:electro_bikes/utils/app_route_string.dart';
import 'package:electro_bikes/utils/controller_class.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../utils/no_glow_scroll_behavior.dart';
import '../../widget/internet_lost_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);

  final ControllerClass controllerClass = Get.put(ControllerClass());
  double? fontSize = 12;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              return Padding(
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
                                      controllerClass.flag.value =
                                          value.flagEmoji;
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
                                    controller: _controller,
                                    onChanged: (value) {
                                      OTPPage.number = value;
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
                            sendOTP(context);
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
              );
            } else {
              return const InternetLostPage();
            }
          },
        ),
      ),
    );
  }

  Future<void> sendOTP(BuildContext context) async {
    if (OTPPage.number.length == 10) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+${controllerClass.countryCode}${OTPPage.number}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          OTPPage.verificationId = verificationId;
          Navigator.pushNamed(context, AppRoutes.otpPage);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      if (OTPPage.number.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Enter Your Number',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Enter Number is Wrong',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
      OTPPage.number = '';
    }
    _controller.clear();
  }
}
