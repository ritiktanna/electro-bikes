// ignore_for_file: must_be_immutable
import 'package:country_picker/country_picker.dart';
import 'package:electro_bikes/utils/app_route_string.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../cubits/firebase/firebase_cubit.dart';
import '../../cubits/firebase/firebase_state.dart';
import '../../utils/no_glow_scroll_behavior.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  String countryCode = '91';
  String number = '';
  String countryCodeFlag = '';
  double? fontSize = 12;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: BlocConsumer<FireBaseCubit, FireBaseState>(
          listener: (context, state) {
            if (state is FireBaseErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${state.errorMessage}',
                  ),
                ),
              );
            } else if (state is CodeUnSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error While sending code')));
            } else if (state is CodeTimeOutState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Failed to enter code',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));
              Navigator.pop(context);
            } else if (state is CodeSendSate) {
              Navigator.pushNamed(context, AppRoutes.otpPage);
            } else if (state is CodeSuccessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Check yor message')));
            }
          },
          builder: (context, state) {
            if (state is CodeSendSate) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
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
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (value) {
                                      countryCodeFlag = value.flagEmoji;
                                      countryCode = '${value.phoneCode}';
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
                                        child: MyTextWidget(
                                          data: Country.parse("IN").flagEmoji,
                                          textStyle:
                                              const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    )
                                  ],
                                ),
                              ),
                              MyTextWidget(
                                data: '+${countryCode}',
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: TextField(
                                    controller: _controller,
                                    onChanged: (value) {
                                      number = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                        RegExp(
                                          r'[0-9]',
                                        ),
                                      ),
                                    ],
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
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
                            BlocProvider.of<FireBaseCubit>(context)
                                .sendOTP(countryCode + number);
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
            }
          },
        ),
      ),
    );
  }
}
