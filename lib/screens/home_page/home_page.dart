import 'package:electro_bikes/widget/app_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyTextWidget(
          data: '${FirebaseAuth.instance.currentUser?.phoneNumber}',
        ),
      ),
    );
  }
}
