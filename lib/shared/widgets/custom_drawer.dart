
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
                      Icon(Icons.account_circle),
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
                InkWell( //cria uma nova fun????o chamada termos de uso e Privacidade:
                child: Container( //cria container
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), //adiciona um padding com 10 de borda tanto na vertical quanto na horizontal
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 5,),
                      Text("Termos de uso e Privacidade"),
                    ],
                  )),
                  onTap: (){ // quando o usuario clicar, ir?? executar a a????o abaixo:
                    showDialog(context: context, //mostra uma caixa de dialogo
                    builder: (BuildContext bc){
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), //bordas redondas no valor 10
                        title: const Text("Termos de uso e Privacidade", style: TextStyle(fontWeight: FontWeight.bold),), //titulo do dialogo com fonte em negrito
                        content: Wrap( //cria uma especie de Container, s?? que formato de acordo com o conteudo abaixo:
                          children: const [Text(" Podemos j?? vislumbrar o modo pelo qual a execu????o dos pontos do programa desafia a capacidade de equaliza????o dos modos de opera????o convencionais. A n??vel organizacional, a expans??o dos mercados mundiais estende o alcance e a import??ncia das condi????es financeiras e administrativas exigidas. Todavia, o desenvolvimento cont??nuo de distintas formas de atua????o apresenta tend??ncias no sentido de aprovar a manuten????o de alternativas ??s solu????es ortodoxas. A pr??tica cotidiana prova que o comprometimento entre as equipes faz parte de um processo de gerenciamento do sistema de forma????o de quadros que corresponde ??s necessidades.",
                          textAlign: TextAlign.center,)], //Texto com alinhamento no centro
                        ),
                        actions: [ //Ap??s o usuario ler os termos de uso, a prox a????o ?? o usuario concordar com os termos
                          TextButton(onPressed: (){ //cria um bot??o que ao ser pressionado pelo usuario
                            Navigator.pop(context); // fecha o dialog
                          }, 
                          child: const Text("OK")) //Bot??o com "OK", O usuario clica e concorda com os termos de uso e Privacidade
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
                      Icon(Icons.settings),
                      SizedBox(width: 5,),
                      Text("Configura????es"),
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
                        title: const Text("Aten????o", style: TextStyle(fontWeight: FontWeight.bold)),
                        content: Wrap(
                          children: const [
                            Text("Deseja realmente sair?"),
                          ],
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("N??o")), //Acionada pelo o usuario, cancela a opera????o
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