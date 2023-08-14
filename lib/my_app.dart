import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/pages/login_page.dart';
import 'package:testapp/pages/splash_screen/splash_screen.dart';
import 'package:testapp/pages/splash_screen/splashscreen_delay.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );

  }
}