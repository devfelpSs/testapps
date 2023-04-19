import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: const Text("Configurações")),
      body: Container(
        child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: "Nome usuário"),
              controller: nomeUsuarioController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Altura"),
              controller: alturaController,
            ),
          ),
        SwitchListTile(
          title: const Text("Receber notificações"),
          onChanged: (bool value){
          setState(() {
            receberNotificacoes = value;
          });
        }, value: receberNotificacoes,
        ),
        SwitchListTile(
          title: const Text("Tema escuro"),
          value: temaEscuro, 
          onChanged: (bool value){
            setState(() {
              temaEscuro = value;
            });
          }),
          TextButton(onPressed: (){}, child: Text("Salvar"))
      ],),
    )));
  }
}