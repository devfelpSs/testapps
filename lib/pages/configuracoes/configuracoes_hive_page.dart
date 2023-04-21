import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/model/configuracoes_model.dart';
import 'package:testapp/repositories/configuracoes_repository.dart';
import 'package:testapp/services/app_storage_service.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Configurações Hive"),
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
            configuracoesModel.receberNotificacoes = value;
          });
        }, value: configuracoesModel.receberNotificacoes,
        ),
        SwitchListTile(
          title: const Text("Tema escuro"),
          value: configuracoesModel.temaEscuro, 
          onChanged: (bool value){
            setState(() {
              configuracoesModel.temaEscuro = value;
            });
          }),
          TextButton(onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            try {
            configuracoesModel.altura = double.parse(alturaController.text);
            } catch (e){
              showDialog(
                context: context, 
                builder: (_){
                  return AlertDialog(
                    title: const Text("Meu App"),
                    content: const Text("Favor informar uma altura valida!"),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                      child: const Text("OK"))],
                  );
                });
                return;
            }
            configuracoesModel.nomeUsuario = nomeUsuarioController.text;
            configuracoesRepository.salvar(configuracoesModel);
            Navigator.pop(context);
          }, child: const Text("Salvar"))
      ],),
    )));
  }
}