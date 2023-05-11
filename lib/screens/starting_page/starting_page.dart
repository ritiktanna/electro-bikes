import 'package:electro_bikes/screens/starting_page/widgets/logo.dart';
import 'package:electro_bikes/screens/starting_page/widgets/starting_page_button.dart';
import 'package:electro_bikes/utils/app_image_string.dart';
import 'package:electro_bikes/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(400),
                    bottomRight: Radius.circular(400),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0059D4),
                      Color(0xff6399E4),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 120,
                left: 120,
                child: Logo(),
              ),
            ],
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
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login-page', (route) => false);
              },
              child: const LoginButton(),
            ),
          ),
        ],
      ),
    );
  }
}
