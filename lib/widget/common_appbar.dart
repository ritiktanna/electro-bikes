import 'package:flutter/material.dart';

import '../utils/app_image_string.dart';
import 'electro_bike_text_logo.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElectroBikeTextLogo(),
        Row(
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                AppImagesString.profilePicture,
              ),
            )
          ],
        )
      ],
    );
  }
}
