import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late SharedPreferences storage; //o late assim como o "!" tbm garante que essa variavel não será nulla
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
    numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
    quantidadeCliques = storage.getInt(CHAVE_QUANTIDADE_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Gerador de números aleatorios")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null ? "Nenhum número gerado" : numeroGerado.toString(), 
              style: const TextStyle(fontSize: 30),
              ),
              Text(
                quantidadeCliques == null ? "Nenhum clique efetuado" : quantidadeCliques.toString(), 
              style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1; //"??" Se a quantidade de cliques for nulla será igual a zero, se não utilize a quantidade de cliques + 1;
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!); //"!" é utilizado para garantir que a variavel não é um nulo e assim elimina erros.
            storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeCliques!);
          },
          ),
      ),
    );
  }
}