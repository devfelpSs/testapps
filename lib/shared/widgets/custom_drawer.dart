
import 'package:flutter/material.dart';

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
                    showModalBottomSheet(context: context, 
                      builder: (BuildContext bc) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                        child: Column(
                          children: const [
                            Text("Termos de uso e privacidade", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text(
                              "A nível organizacional, a constante divulgação das informações obstaculiza a apreciação da importância do processo de comunicação como um todo. O cuidado em identificar pontos críticos na contínua expansão de nossa atividade oferece uma interessante oportunidade para verificação dos índices pretendidos. O incentivo ao avanço tecnológico, assim como o consenso sobre a necessidade de qualificação deve passar por modificações independentemente do impacto na agilidade decisória. As experiências acumuladas demonstram que a valorização de fatores subjetivos não pode mais se dissociar de todos os recursos funcionais envolvidos. Podemos já vislumbrar o modo pelo qual o aumento do diálogo entre os diferentes setores produtivos afeta positivamente a correta previsão dos níveis de motivação departamental.", 
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    });
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
              ],
            ),
        );
  }
}