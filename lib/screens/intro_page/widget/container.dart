import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
          color: Color(0xff0059D4),
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: Image.asset(
        imagePath,
        scale: 1.5,
      ),
    );
  }
}
