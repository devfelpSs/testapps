import "package:animated_text_kit/animated_text_kit.dart";
import "package:convex_bottom_bar/convex_bottom_bar.dart";
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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
  }

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
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.orange,
          )
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.map, title: 'Discovery'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.message, title: 'Message'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ], onTap: (int i) => tabController.index = i,
      controller: tabController,
    ));
  }
}
