
import 'package:flutter/material.dart';
import 'package:testapp/pages/login_page.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      context: context, 
                      builder: (BuildContext bc){
                      return Wrap(
                        children: [
                            ListTile(
                              onTap: () {Navigator.pop(context);},
                              title: const Text("Camera"),
                              leading: const Icon(Icons.camera),
                            ),
                            ListTile(
                              onTap: (){Navigator.pop(context);},
                              title: const Text("Galeria"),
                              leading: const Icon(Icons.album),
                            )
                        ],
                      );
                  });
                },
                child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.orange),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Image.network("https://avatars.githubusercontent.com/u/30783071?v=4")),
                  accountName: const Text("Felipe de Souza"), 
                  accountEmail: const Text("email@email.com")),
              ),
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
                  onTap: (){
                    showDialog(context: context, 
                    builder: (BuildContext bc){
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        title: const Text("Termos de uso e Privacidade", style: TextStyle(fontWeight: FontWeight.bold),),
                        content: Wrap(
                          children: const [Text(" Podemos já vislumbrar o modo pelo qual a execução dos pontos do programa desafia a capacidade de equalização dos modos de operação convencionais. A nível organizacional, a expansão dos mercados mundiais estende o alcance e a importância das condições financeiras e administrativas exigidas. Todavia, o desenvolvimento contínuo de distintas formas de atuação apresenta tendências no sentido de aprovar a manutenção de alternativas às soluções ortodoxas. A prática cotidiana prova que o comprometimento entre as equipes faz parte de um processo de gerenciamento do sistema de formação de quadros que corresponde às necessidades.")],
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: const Text("OK"))
                        ],
                      );
                    }
                    );
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
                      Text("Configurações"),
                    ],
                  )),
                  onTap: (){},
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 5,),
                      Text("Sair"),
                    ],
                  )),
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext bc) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        title: const Text("Atenção", style: TextStyle(fontWeight: FontWeight.bold)),
                        content: Wrap(
                          children: const [
                            Text("Deseja realmente sair?"),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("Não")), //Acionada pelo o usuario, cancela a operação
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => const LoginPage()));    //Limpa a stack inteira e envia o usuario para a tela de login novamente
                          }, child: const Text("Sim")),
                        ],
                      ); 
                    });
                  }
                ),
              ],
            ),
        );
  }
}