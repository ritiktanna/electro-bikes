import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, this.onTap, required this.text})
      : super(key: key);
  final VoidCallback? onTap;
  final String text;

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
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(
                text,
                style: const TextStyle(
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
