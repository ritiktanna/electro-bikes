// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:electro_bikes/cubits/range_selector/range_selector_cubit.dart';
import 'package:electro_bikes/utils/app_colors.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/range_selector/range_state.dart';

class HomePageRangeSection extends StatelessWidget {
  HomePageRangeSection({Key? key, required this.state, this.rnd})
      : super(key: key);
  final int randomNumber = Random().nextInt(100);
  final RangeState state;
  int? rnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(15, 20),
              color: AppColors.blackColor,
              blurRadius: 25,
              spreadRadius: -45),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<RangeSelectorCubit>(context).changeRange(1);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(
                        state is FirstRangeSelectedState ? 10 : 0),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(
                        state is FirstRangeSelectedState ? 10 : 0),
                  ),
                  color: (state is FirstRangeSelectedState)
                      ? AppColors.blueColor
                      : AppColors.lightGreyColor,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                        state is FirstRangeSelectedState ? 20 : 10),
                    child: Column(
                      children: [
                        FittedBox(
                          child: MyTextWidget(
                            data:
                                '${randomNumber + Random().nextInt(20)}${AppStrings.km}',
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: state is FirstRangeSelectedState
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: MyTextWidget(
                            data: AppStrings.eco,
                            textStyle: TextStyle(
                              color: state is FirstRangeSelectedState
                                  ? AppColors.whiteColor
                                  : AppColors.greenColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<RangeSelectorCubit>(context).changeRange(2);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (state is SecondRangeSelectedState)
                        ? AppColors.blueColor
                        : AppColors.lightGreyColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                        state is SecondRangeSelectedState ? 10 : 0))),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                        state is SecondRangeSelectedState ? 20 : 10),
                    child: Column(
                      children: [
                        FittedBox(
                          child: MyTextWidget(
                            data: '${randomNumber}${AppStrings.km}',
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: state is SecondRangeSelectedState
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: MyTextWidget(
                            data: AppStrings.normal,
                            textStyle: TextStyle(
                              color: (state is SecondRangeSelectedState)
                                  ? AppColors.whiteColor
                                  : AppColors.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<RangeSelectorCubit>(context).changeRange(3);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(
                        state is ThirdRangeSelectedState ? 10 : 0),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(
                        state is ThirdRangeSelectedState ? 10 : 0),
                  ),
                  color: (state is ThirdRangeSelectedState)
                      ? AppColors.blueColor
                      : AppColors.lightGreyColor,
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                        state is ThirdRangeSelectedState ? 20 : 10),
                    child: Column(
                      children: [
                        FittedBox(
                          child: MyTextWidget(
                            data:
                                '${(randomNumber - Random().nextInt(20) < 0) ? 0 : randomNumber - Random().nextInt(20)}${AppStrings.km}',
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: (state is ThirdRangeSelectedState)
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                          ),
                        ),
                        MyTextWidget(
                          data: AppStrings.sport,
                          textStyle: TextStyle(
                            color: (state is ThirdRangeSelectedState)
                                ? AppColors.whiteColor
                                : AppColors.redColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
