import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              AppStrings.skip,
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ).copyWith(
            top: 23,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.navigation,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.searchAndLocate,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: const Color(
                  0xff7D7D7D,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              AppImagesString.mapImageLogo,
            ),
          ),
        ),
      ],
    );
  }
}
