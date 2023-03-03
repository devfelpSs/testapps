import 'package:flutter/material.dart';
import 'package:testapp/pages/dados_cadastrais.dart';
import 'package:testapp/pages/pagina1.dart';
import 'package:testapp/pages/pagina2.dart';
import 'package:testapp/pages/pagina3.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key ? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
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
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DadosCadastraisPage(
                        texto: "Meus dados",
                        dados: ["Nome", "Endereço", "Tel"],
                      )));
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
        // ignore: prefer_const_literals_to_create_immutables
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value){
                  setState(() {
                  posicaoPagina = value;
                    
                  });
                },
                children: const [
                Pagina1Page(),
                Pagina2Page(),
                Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value){
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina, items: const [
              BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Page2", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Page3", icon: Icon(Icons.person)),
            ])
          ],
        ),
      ),
    );
  }
}
