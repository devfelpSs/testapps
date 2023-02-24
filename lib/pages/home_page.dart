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
        title: Text("Meu App", 
        style: GoogleFonts.roboto(fontSize: 30),
        ),
      ),
      body: Container(
        color: Colors.amberAccent,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //alinhamento do bloco
            mainAxisAlignment: MainAxisAlignment.center,     //alinhamento da coluna
            children: [ 
                Text(
                "Ações do usuario",
                style: GoogleFonts.acme(fontSize: 20),
              ),
                Text(
                "Número gerado: $numeroGerado",
                style: GoogleFonts.acme(fontSize: 20),
              ),
                Text(
                  "Foi clicado: $quantidadedeCliques vezes",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
                Row(
                  children: [
                  Text(
                  "10",
                  style: GoogleFonts.acme(fontSize: 20),
                    ),
                    Text(
                  "20",
                  style: GoogleFonts.acme(fontSize: 20),
                    ),
                    Text(
                  "30",
                  style: GoogleFonts.acme(fontSize: 20),
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