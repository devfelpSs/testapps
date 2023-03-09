
import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Image.network("https://avatars.githubusercontent.com/u/30783071?v=4")),
                accountName: const Text("Felipe de Souza"), 
                accountEmail: const Text("email@email.com")),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 5,),
                      Text("Dados Cadastrais"),
                    ],
                  )),
                onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisPage()));
                  },
                ),
                const Divider(),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 5,),
                      Text("Termos de uso e Privacidade"),
                    ],
                  )),
                  onTap: (){},
                ),
                const Divider(),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 5,),
                      Text("Configurações"),
                    ],
                  )),
                  onTap: (){},
                ),
              ],
            ),
        );
  }
}