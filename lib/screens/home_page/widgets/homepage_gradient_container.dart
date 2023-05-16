import 'dart:math';

import 'package:electro_bikes/utils/app_colors.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/gradient_container.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_image_string.dart';
import '../../../widget/app_text_widget.dart';

class HomePageGradientContainer extends StatelessWidget {
  HomePageGradientContainer({Key? key}) : super(key: key);

  final int random = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15).copyWith(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImagesString.batteryImage,
                        scale: 0.9,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: MyTextWidget(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          data: '${random}%',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: MyTextWidget(
                      textAlign: TextAlign.start,
                      data: '${random} ${AppStrings.km}',
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MyTextWidget(
                    textAlign: TextAlign.start,
                    data: AppStrings.range,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MyTextWidget(
                      textAlign: TextAlign.start,
                      data: '${random + Random().nextInt(10)} ${AppStrings.km}',
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MyTextWidget(
                    textAlign: TextAlign.start,
                    data: AppStrings.predicted,
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              AppImagesString.blackBike,
            ),
          ),
        ],
      ),
    );
  }
}
