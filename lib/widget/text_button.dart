import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.data, this.textStyle, this.onTap})
      : super(key: key);
  final String data;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        data,
        style: GoogleFonts.poppins(textStyle: textStyle),
      ),
    );
  }
}
