import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElectroBikeTextLogo extends StatelessWidget {
  const ElectroBikeTextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Electro Bike',
      style: GoogleFonts.audiowide(
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }
}
