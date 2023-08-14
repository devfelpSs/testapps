import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() =>  _AutoSizeTextPageState();
}

class  _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Auto Size text"),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4 ),
                child: Text("Caros amigos, a execução dos pontos do programa nos obriga à análise dos índices pretendidos. As experiências acumuladas demonstram que o desafiador cenário globalizado cumpre um papel essencial na formulação das posturas dos órgãos dirigentes com relação às suas atribuições. Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação exige a precisão e a definição do sistema de participação geral. A nível organizacional, a estrutura atual da organização estimula a padronização das direções preferenciais no sentido do progresso. "))),),
      ));
  }
}