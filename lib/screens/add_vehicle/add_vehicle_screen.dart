// ignore_for_file: must_be_immutable

import 'package:electro_bikes/cubits/chassis_number/chassis_number_state.dart';
import 'package:electro_bikes/utils/app_colors.dart';
import 'package:electro_bikes/utils/app_route_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:electro_bikes/widget/common_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/chassis_number/chassis_number_cubit.dart';
import '../../utils/app_image_string.dart';

class AddVehicle extends StatelessWidget {
  AddVehicle({Key? key}) : super(key: key);
  String _chassisNumber = '';
  String? userNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        MyTextWidget(
                          textAlign: TextAlign.center,
                          data: AppStrings.addVehicle,
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: MyTextWidget(
                        data:
                            '${userNumber?.substring(0, 3)}*******${userNumber?.substring(10)}',
                        textStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImagesString.scooter,
                    ),
                    MyTextWidget(
                      data: AppStrings.chassisNumber,
                      textStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyTextWidget(
                          data: AppStrings.frameNumber,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffEAEAEA)),
                        color: AppColors.offWhiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: TextField(
                          onSubmitted: (value) {
                            BlocProvider.of<ChassisNumberCubit>(context)
                                .changeInChassisNumber(value);
                          },
                          onChanged: (value) {
                            _chassisNumber = value;
                            BlocProvider.of<ChassisNumberCubit>(context)
                                .changeInChassisNumber(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon:
                                BlocBuilder<ChassisNumberCubit, ChassisNumber>(
                              builder: (context, state) {
                                if (state is InitialState ||
                                    state is EmptyChassisNumber) {
                                  return Icon(Icons.error);
                                } else if (state is RightChassisNumber) {
                                  return Icon(Icons.check);
                                } else {
                                  return Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: CommonButton(
                        text: AppStrings.verified,
                        onTap: () {
                          print('pressed');
                          if (_chassisNumber.length == 17) {
                            Navigator.pushNamed(context, AppRoutes.homePage);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
