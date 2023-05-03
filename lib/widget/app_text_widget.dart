import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key, required this.data, this.textStyle})
      : super(key: key);
  final String data;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.poppins(textStyle: textStyle),
    );
  }
}
