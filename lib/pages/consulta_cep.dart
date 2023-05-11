import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/viacep_model.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({Key? key}) : super(key: key);

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
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
              onChanged: (String value) async {
                var cep = value.trim().replaceAll(new RegExp(r'[^0-9]'),'');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  var response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
                  print(response.statusCode);
                  print(response.body);
                  var json = jsonDecode(response.body);
                  viacepModel = ViaCEPModel.fromJson(json);
                  print(viacepModel);
                }
                setState(() {
                  loading = false;
                });
              },
              ),
              const SizedBox(
                height: 50,
              ),
              Text (
                viacepModel.logradouro ?? "", 
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}", 
                style: const TextStyle(fontSize: 22),
              ),
              Visibility(visible: loading,child: const CircularProgressIndicator())
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