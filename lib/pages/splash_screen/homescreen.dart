import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:testapp/pages/main_page.dart";
import "package:testapp/shared/widgets/custom_drawer.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(
            "Meu App",
            style: GoogleFonts.roboto(),
          ),
        ),
        body: PageView(children: [
          Container(color: Colors.yellow,),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.orange,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label:"Item1", icon: FaIcon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(label:"Item1", icon: FaIcon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(label:"Item1", icon: FaIcon(FontAwesomeIcons.home)),
          BottomNavigationBarItem(label:"Item1", icon: FaIcon(FontAwesomeIcons.home)),
      ],),
    );
  }
}
