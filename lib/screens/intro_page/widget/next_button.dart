import 'package:electro_bikes/utils/app_strings.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0059D4),
              Color(0xff5A94E3),
            ],
          ),
        ),
        child: const Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Text(
                AppStrings.next,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
      ),
    );
  }
}
