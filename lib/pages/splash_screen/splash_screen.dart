import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:testapp/pages/main_page.dart";

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.yellow, Colors.purple],
            //stops: [0.7, 0.3,]
          ),
        ),
        child: Center(
            child: SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              onFinished: (){
                Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (builder) => const MainPage()));
              },
              animatedTexts: [
                FadeAnimatedText('splash SCREEN'),
                FadeAnimatedText('fade ANIMATION'),
                FadeAnimatedText('in FLUTTER'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        )),
      ),
    ));
  }
}
