import 'package:electro_bikes/cubits/chassis_number/chassis_number_state.dart';
import 'package:electro_bikes/utils/app_colors.dart';
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
  final _user = FirebaseAuth.instance.currentUser;
  // String _chassisNumber = '';

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
                            '+${_user?.phoneNumber?.substring(0, 3)}*******${_user?.phoneNumber?.substring(10)}',
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
                            // _chassisNumber = value;
                            BlocProvider.of<ChassisNumberCubit>(context)
                                .changeInChassisNumber(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon:
                                BlocBuilder<ChassisNumberCubit, ChassisNumber>(
                              builder: (context, state) {
                                if (state is InitialState ||
                                    state is WrongChassisNumber) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return Icon(
                                    Icons.check,
                                    color: AppColors.blueColor,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    BlocListener<ChassisNumberCubit, ChassisNumber>(
                      listener: (context, state) {
                        if (state is EmptyChassisNumber) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.redColor,
                              content: MyTextWidget(
                                data: AppStrings.cantBeEmpty,
                                textStyle: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          );
                        } else if (state is WrongChassisNumber) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.redColor,
                              content: MyTextWidget(
                                data: '${state.errorMessage}',
                                textStyle: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: CommonButton(
                          text: AppStrings.verified,
                          onTap: () {},
                        ),
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
