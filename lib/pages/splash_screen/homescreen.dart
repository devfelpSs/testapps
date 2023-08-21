import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:testapp/pages/main_page.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: PageView(children: [
        Container(color: Colors.yellow,),
        Container(color: Colors.blue,),
        Container(color: Colors.red,),
        Container(color: Colors.green,),
        Container(color: Colors.orange,)
      ],
        
    )));
  }
}
