import 'package:electro_bikes/screens/starting_page/widgets/startingpage_button.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppImagesString.startingImage,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ).copyWith(
              right: 66,
              left: 66,
            ),
            child: Image.asset(
              AppImagesString.electroBikeAppTextImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              AppStrings.startingScreenSubTitle,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff7D7D7D),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: LoginButton(),
          ),
        ],
      ),
    );
  }
}
