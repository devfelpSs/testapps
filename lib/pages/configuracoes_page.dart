import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_TEMA_ESCURO = "CHAVE_TEMA_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
    alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
    receberNotificacoes = storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
    temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Configurações"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings,),
              onPressed: (){},) //Faz alguma coisa dentro das chaves
          ],
          ),
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
          TextButton(onPressed: () async {
            await storage.setString(
              CHAVE_NOME_USUARIO, nomeUsuarioController.text);
            await storage.setDouble(
              CHAVE_ALTURA, double.tryParse(alturaController.text) ?? 0);
            await storage.setBool(
              CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
            await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
            Navigator.pop(context);
          }, child: Text("Salvar"))
      ],),
    )));
  }
}