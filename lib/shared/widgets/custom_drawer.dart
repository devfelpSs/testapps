//Utilizar esse arquivo para construir o app...
import 'package:flutter/material.dart';
import 'package:testapp/model/dados_cadastrais_model.dart';
import 'package:testapp/pages/configuracoes/configuracoes_shared_preferences_page.dart';
import 'package:testapp/pages/login_page.dart';
import 'package:testapp/pages/numeros_aleatorios/numeros_aleatorios_shared_preferences.dart';
import 'package:testapp/pages/posts_page.dart';

import '../../pages/configuracoes/configuracoes_hive_page.dart';
import '../../pages/dados_cadastrais/dados_cadastrais_hive.dart';
import '../../pages/numeros_aleatorios/numeros_aleatorios_hive.dart';
import '../../repositories/marvel/marvel_repository.dart';

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisHivePage()));
                  },
                ),
                const Divider(),
                InkWell( //cria uma nova função chamada termos de uso e Privacidade:
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
                  onTap: (){ // quando o usuario clicar, irá executar a ação abaixo:
                    showDialog(context: context, //mostra uma caixa de dialogo
                    builder: (BuildContext bc){
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), //bordas redondas no valor 10
                        title: const Text("Termos de uso e Privacidade", style: TextStyle(fontWeight: FontWeight.bold),), //titulo do dialogo com fonte em negrito
                        content: Wrap( //cria uma especie de Container, só que formato de acordo com o conteudo abaixo:
                          children: const [Text(" Podemos já vislumbrar o modo pelo qual a execução dos pontos do programa desafia a capacidade de equalização dos modos de operação convencionais. A nível organizacional, a expansão dos mercados mundiais estende o alcance e a importância das condições financeiras e administrativas exigidas. Todavia, o desenvolvimento contínuo de distintas formas de atuação apresenta tendências no sentido de aprovar a manutenção de alternativas às soluções ortodoxas. A prática cotidiana prova que o comprometimento entre as equipes faz parte de um processo de gerenciamento do sistema de formação de quadros que corresponde às necessidades.",
                          textAlign: TextAlign.center,)], //Texto com alinhamento no centro
                        ),
                        actions: [ //Após o usuario ler os termos de uso, a prox ação é o usuario concordar com os termos
                          TextButton(onPressed: (){ //cria um botão que ao ser pressionado pelo usuario
                            Navigator.pop(context); // fecha o dialog
                          }, 
                          child: const Text("OK")) //Botão com "OK", O usuario clica e concorda com os termos de uso e Privacidade
                        ],
                      );
                    }
                    );
                  },
                ),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.table_view),
                      SizedBox(width: 5,),
                      Text("Gerador de números"),
                    ],
                  )),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (bc) =>
                        const NumerosAleatoriosSharedPreferencePage()), 
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(width: 5,),
                      Text("Configurações"),
                    ],
                  )),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (bc) =>
                        const ConfiguracoesHivePage()), 
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.post_add),
                      SizedBox(width: 5,),
                      Text("Posts"),
                    ],
                  )),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (bc) =>
                        const PostsPage()), 
                    );
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                                InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      Icon(Icons.token),
                      SizedBox(width: 5,),
                      Text("Herois"),
                    ],
                  )),
                  onTap: () async {
                    var marvelRepository = MarvelRepository();
                    var heroes = await marvelRepository.getCharacters();
                    print(heroes);
                    Navigator.pop(context);
                    //Navigator.push(
                     // context,
                     // MaterialPageRoute(
                       // builder: (bc) =>
                        //const PostsPage()), 
                    //);
                  },
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