import 'package:electro_bikes/screens/home_page/home_page.dart';
import 'package:electro_bikes/screens/intro_page/intro_page.dart';
import 'package:electro_bikes/screens/starting_page/starting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var seen = await SharedPreferences.getInstance();
  var seenKey = 'Seen Key';
  var firstTime = seen.getBool(seenKey) ?? false;

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      firstTime
          ? const MaterialApp(
              debugShowCheckedModeBanner: false, home: StartingPage())
          : MyApp(sharedPreferences: seen, seenKey: seenKey),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key, required this.sharedPreferences, required this.seenKey})
      : super(key: key);
  final SharedPreferences sharedPreferences;
  final String seenKey;

  @override
  Widget build(BuildContext context) {
    sharedPreferences.setBool(seenKey, true);
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('en')],
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return const HomePage();
          } else {
            return const IntroPage();
          }
        },
      ),
    );
  }
}
