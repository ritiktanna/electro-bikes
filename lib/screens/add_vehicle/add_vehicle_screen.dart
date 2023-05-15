import 'package:electro_bikes/screens/otp_page/opt_page.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_image_string.dart';
import '../../utils/controller_class.dart';

class AddVehicle extends StatelessWidget {
  AddVehicle({Key? key}) : super(key: key);
  final ControllerClass controllerClass = Get.put(ControllerClass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: MyTextWidget(
                        data: AppStrings.addVehicle,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MyTextWidget(
                  data: '${AppStrings.hello} '
                      '+${controllerClass.countryCode.value}*******${OTPPage.number.substring(7)}',
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.asset(
                AppImagesString.redBike,
              )
            ],
          ),
        ),
      ),
    );
  }
}
