import 'package:electro_bikes/screens/add_vehicle/add_vehicle_screen.dart';
import 'package:electro_bikes/screens/auth_check/auth_check.dart';
import 'package:electro_bikes/screens/home_page/home_page.dart';
import 'package:electro_bikes/screens/intro_page/intro_page.dart';
import 'package:electro_bikes/screens/login_page/login_page.dart';
import 'package:electro_bikes/screens/otp_page/opt_page.dart';
import 'package:electro_bikes/screens/starting_page/starting_page.dart';
import 'package:electro_bikes/screens/verified_page/otp_verified_page.dart';
import 'package:electro_bikes/utils/app_route_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubits/chassis_number/chassis_number_cubit.dart';
import 'cubits/firebase/firebase_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var seen = await SharedPreferences.getInstance();
  String? seenKey = 'Seen Key';
  var firstTime = seen.getBool(seenKey) ?? false;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FireBaseCubit(),
        ),
        BlocProvider(
          create: (context) => ChassisNumberCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          AppRoutes.introPage: (context) => const IntroPage(),
          AppRoutes.startingPage: (context) => const StartingPage(),
          AppRoutes.logInPage: (context) => LogInPage(),
          AppRoutes.otpPage: (context) => OTPPage(),
          AppRoutes.verifiedPage: (context) => const VerifiedPage(),
          AppRoutes.homePage: (context) => const HomePage(),
          AppRoutes.addVehiclePage: (context) => AddVehicle(),
        },
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en'),
        ],
        home: firstTime
            ? const AuthCheck()
            : IntroPage(
                sharedPreferences: seen,
                seenKey: seenKey,
              ),
      ),
    ),
  );
}
