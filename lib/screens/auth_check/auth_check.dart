import 'package:electro_bikes/screens/home_page/home_page.dart';
import 'package:electro_bikes/screens/starting_page/starting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return const HomePage();
    } else {
      return const StartingPage();
    }
  }
}
