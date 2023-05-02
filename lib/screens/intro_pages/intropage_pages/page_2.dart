import 'package:electro_bikes/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_image_string.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 53,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.safety,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.focus,
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
              AppImagesString.securityImage,
            ),
          ),
        ),
      ],
    );
  }
}
