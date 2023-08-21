import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:testapp/pages/main_page.dart";

class SplashScreenDelayPage extends StatefulWidget {
  const SplashScreenDelayPage({super.key});

  @override
  State<SplashScreenDelayPage> createState() => _SplashScreenDelayPageState();
}

class _SplashScreenDelayPageState extends State<SplashScreenDelayPage> {
  openHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
      child: Scaffold(
      body: PageView(

    )));
  }
}
