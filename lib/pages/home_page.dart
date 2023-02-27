import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp/service/gerador_numer_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;
  var quantidadedeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Meu App", 
        style: GoogleFonts.roboto(fontSize: 30),
        ),
      ),
      body: Container( //Container principal
        color: const Color.fromRGBO(195, 221, 255, 01), //setando container com cores RGB e com opacitade
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //alinhamento do bloco
            mainAxisAlignment: MainAxisAlignment.start,     //alinhamento da coluna
            children: [ 
              SizedBox(
                child: Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Text(
                    "Ações do usuario",
                    style: GoogleFonts.acme(fontSize: 20),
                    ),
                  )
                ),
              ),
              SizedBox(
                child: Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    color: Colors.orange,
                    child:Text(
                      "Número gerado: $numeroGerado",
                      style: GoogleFonts.acme(fontSize: 20),
                    ),
                  )),
              ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    color: Colors.deepPurpleAccent,
                    child: Text(
                    "Foi clicado: $quantidadedeCliques vezes",
                    style: GoogleFonts.acme(fontSize: 20),
                    ),
                )),

                Row( //colocar dentro de um container
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                    color: Colors.red,
                    child: Text(
                    "Nome:",
                    style: GoogleFonts.acme(fontSize: 20),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                    color: Colors.blue,
                    child:  Text(
                    "Felipe",
                    style: GoogleFonts.acme(fontSize: 20),
                    ),
                    )
                  ),
                  Expanded(
                    child: Container(
                    color: Colors.green,
                    child:  Text(
                    "30",
                    style: GoogleFonts.acme(fontSize: 20),
                    ),
                    )
                  ),  
                ],
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(       //Função botao flutuante
        child: const Icon(Icons.add_box), onPressed: (){
          setState(() {
            quantidadedeCliques = quantidadedeCliques + 1;
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        }),
    );
  }
} 