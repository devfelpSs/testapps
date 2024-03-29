import 'package:flutter/material.dart';
import 'package:testapp/pages/card_page.dart';
import 'package:testapp/pages/list_view.dart';
import 'package:testapp/pages/list_view_h.dart';
import 'package:testapp/pages/tarefa_page/tarefa_sqlite_page.dart';
import 'package:testapp/pages/consulta_cep.dart';
import '../shared/widgets/custom_drawer.dart';
import 'package:testapp/pages/pagina_teste.dart';


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
        drawer: const CustomDrawer(),
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
                ConsultaCEP(),
                CardPage(),
                ListViewPage(),
                ListViewHorizontal(),
                TarefaSQLitePage(),
                CircularPercentIndicatorPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value){
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina, items: const [
              BottomNavigationBarItem(label: "HTTP", icon: Icon(Icons.get_app_rounded)),
              BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Page2", icon: Icon(Icons.find_in_page)),
              //BottomNavigationBarItem(label: "Page3", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Page3", icon: Icon(Icons.widgets)),
              BottomNavigationBarItem(label: "Page4", icon: Icon(Icons.image)),
              BottomNavigationBarItem(label: "Teste", icon: Icon(Icons.list)),
            ])
          ],
        ),
      ),
    );
  }
}
