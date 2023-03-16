import 'package:flutter/material.dart';
import 'package:testapp/shared/widgets/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({Key? key}) : super(key: key);

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(child: Image.asset(AppImages.montain1,)),
                Card(child: Image.asset(AppImages.montain2,)),
                Card(child: Image.asset(AppImages.montain3,)),
                Card(child: Image.asset(AppImages.montain4,)),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ));
  }
}