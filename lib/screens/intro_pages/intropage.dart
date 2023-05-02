// ignore_for_file: must_be_immutable

import 'package:electro_bikes/screens/intro_pages/intropage_pages/page_1.dart';
import 'package:electro_bikes/screens/intro_pages/intropage_pages/page_2.dart';
import 'package:electro_bikes/screens/intro_pages/utils/controller.dart';
import 'package:electro_bikes/screens/intro_pages/widgets/button.dart';
import 'package:electro_bikes/screens/intro_pages/widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPages extends StatelessWidget {
  IntroPages({Key? key}) : super(key: key);

  final ControllerClass controller = Get.put(ControllerClass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: ((index) {
                    controller.changeValue();
                  }),
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    Page1(),
                    Page2(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Obx(
                  () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicator(
                          isSelected: controller.firstIndicator.value,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Indicator(
                          isSelected: controller.secondIndicator.value,
                        )
                      ],
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                child: Button(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
