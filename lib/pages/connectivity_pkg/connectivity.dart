import 'package:flutter/material.dart';

class ConnectivityPlusPage extends StatefulWidget {
  const ConnectivityPlusPage({super.key});

  @override
  State<ConnectivityPlusPage> createState() => _ConnectivityPlusPageState();
}

class _ConnectivityPlusPageState extends State<ConnectivityPlusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Connectivity"),
        ),
        body: Container(),
      ),
    );
  }
}
