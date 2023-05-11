import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({Key? key}) : super(key: key);

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");
  String endereco = "";
  String cidade = "";
  String estado = "";
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text("Consulta de CEP", style: TextStyle(fontSize: 22),
              ),
              TextField(controller: cepController,
              keyboardType: TextInputType.number,
              //maxLength: 8,
              onChanged: (String value) {
                var cep = value.trim().replaceAll(new RegExp(r'[^0-9]'),'');
                if (cep.length == 8) {
                  cidade = "Cidade";
                  estado = "Estado";
                  endereco = "Endereco";

                }else {
                  cidade = "";
                  estado = "";
                  endereco = "";
                }
                setState(() {});
              },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                endereco, 
                style: TextStyle(fontSize: 22)
              ),
              Text(
                "$cidade - $estado", 
                style: TextStyle(fontSize: 22)
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var response = await http.get(Uri.parse("https://www.google.com"));
            print(response.statusCode);
            print(response.body);
      }),      
    ));
  }
}