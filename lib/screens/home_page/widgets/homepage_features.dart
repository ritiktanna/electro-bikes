import 'package:electro_bikes/cubits/features/feature_cubit.dart';
import 'package:electro_bikes/cubits/features/feature_states.dart';
import 'package:electro_bikes/utils/app_colors.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_strings.dart';

class HomePageFeatures extends StatelessWidget {
  HomePageFeatures({Key? key, required this.state}) : super(key: key);

  final FeatureState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<FeatureCubit>(context)
                  .changeInFeature(index: 1, isSelected: true);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight:
                      Radius.circular(state is FirstFeatureState ? 10 : 0),
                  bottomLeft: Radius.circular(10),
                  bottomRight:
                      Radius.circular(state is FirstFeatureState ? 10 : 0),
                ),
                color: (state is FirstFeatureState)
                    ? AppColors.blueColor
                    : AppColors.lightGreyColor,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(state is FirstFeatureState ? 20 : 10),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImagesString.lockImage,
                        color: state is FirstFeatureState
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                      ),
                      FittedBox(
                        child: MyTextWidget(
                          data: AppStrings.lock,
                          textStyle: TextStyle(
                            color: state is FirstFeatureState
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
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
              BlocProvider.of<FeatureCubit>(context)
                  .changeInFeature(index: 2, isSelected: true);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(state is SecondFeatureState ? 10 : 0)),
                color: (state is SecondFeatureState)
                    ? AppColors.blueColor
                    : AppColors.lightGreyColor,
              ),
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.all(state is SecondFeatureState ? 20 : 10),
                  child: Column(
                    children: [
                      Image.asset(
                        AppImagesString.lightImage,
                        color: (state is SecondFeatureState)
                            ? AppColors.blueColor
                            : AppColors.blackColor,
                      ),
                      FittedBox(
                        child: MyTextWidget(
                          data: AppStrings.light,
                          textStyle: TextStyle(
                            color: state is SecondFeatureState
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
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
              BlocProvider.of<FeatureCubit>(context)
                  .changeInFeature(index: 3, isSelected: true);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight:
                      Radius.circular(state is ThirdFeatureState ? 10 : 0),
                  bottomLeft: Radius.circular(10),
                  bottomRight:
                      Radius.circular(state is ThirdFeatureState ? 10 : 0),
                ),
                color: (state is ThirdFeatureState)
                    ? AppColors.blueColor
                    : AppColors.lightGreyColor,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(state is ThirdFeatureState ? 20 : 10),
                  child: Column(
                    children: [
                      Image.asset(AppImagesString.trunkImage),
                      FittedBox(
                        child: MyTextWidget(
                          data: AppStrings.eco,
                          textStyle: TextStyle(
                            color: state is ThirdFeatureState
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
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
      ],
    );
  }
}
