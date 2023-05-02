// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class Indicator extends StatelessWidget {
  Indicator({
    Key? key,
    required this.isSelected,
  }) : super(key: key);
  final bool isSelected;
  double size = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          100,
        ),
      ),
      child: SizedBox(
        height: size,
        width: size,
        child: Container(
          decoration: BoxDecoration(
            color: Color(
              isSelected ? 0xff002233 : 0xffD9D9D9,
            ),
          ),
        ),
      ),
    );
  }
}
