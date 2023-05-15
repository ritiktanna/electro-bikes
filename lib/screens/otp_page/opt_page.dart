// ignore_for_file: must_be_immutable

import 'package:electro_bikes/cubits/firebase/firebase_cubit.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_route_string.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../utils/app_strings.dart';
import '../../widget/electro_bike_text_logo.dart';

class OTPPage extends StatelessWidget {
  OTPPage({Key? key}) : super(key: key);
  static String verificationId = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  var code = '';
  static String number = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const ElectroBikeTextLogo(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0).copyWith(top: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      data: '',
                      // '+${controllerClass.countryCode.value}*******${number.substring(7)}',
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
                      length: 6,
                      onChanged: (value) {
                        code = value;
                      },
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 30,
                    ),
                    child: CommonButton(
                      text: AppStrings.verifyAndProceed,
                      onTap: () {
                        BlocProvider.of<FireBaseCubit>(context).verifyOTP(code);
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.verifiedPage, (route) => false);
                      },
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

  Future<void> verifyOTP(BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      await auth.signInWithCredential(credential);
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.verifiedPage, (route) => false);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
