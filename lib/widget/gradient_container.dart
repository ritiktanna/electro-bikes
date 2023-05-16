import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.skyBlueColor,
              AppColors.whiteColor,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }
}
