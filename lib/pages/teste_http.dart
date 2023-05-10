import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HttpTestePage extends StatefulWidget {
  const HttpTestePage({super.key});

  @override
  State<HttpTestePage> createState() => _HttpTestePageState();
}

class _HttpTestePageState extends State<HttpTestePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(),
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),      
      ));
  }
}