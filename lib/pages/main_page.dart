import 'package:flutter/material.dart';
import 'package:testapp/pages/dados_cadastrais.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key ? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(title: const Text("Main Page"),
        centerTitle: true,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Dados Cadastrais")),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisPage()));
                    },
                  ),
                  const Divider(),
                  InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e Privacidade")),
                    onTap: (){},
                  ),
                  const Divider(),
                  InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações")),
                    onTap: (){},
                  ),
                ],
              ),
          ),
        ),
        ),
    );
  }
}
