import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(75))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          AppImagesString.electroBikeAppLogo,
          scale: 1.9,
        ),
      ),
    );
  }
}
