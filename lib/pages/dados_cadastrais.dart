
import 'package:flutter/material.dart';
import 'package:testapp/repositories/linguagens_repository.dart';
import 'package:testapp/repositories/nivel_repository.dart';
import 'package:testapp/shared/widgets/text_label.dart';


class DadosCadastraisPage extends StatefulWidget {

  const DadosCadastraisPage({Key ? key,}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepoistory = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

@override void initState() {
    // ignore: todo
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepoistory.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima){
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidadeMaxima; i++ ){
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
        ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus dados"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
            controller: nomeController,
          ),
          const TextLabel(texto: "Data de nascimento"),
          TextField(
            controller: dataNascimentoController,
            readOnly: true,
            onTap: () async {
              var data = await showDatePicker(
                context: context,
                initialDate: DateTime(2000,1,1), 
                firstDate: DateTime(1900,1,1), 
                lastDate: DateTime(2023,10,23));
              if (data != null){
                dataNascimentoController.text = data.toString();
                dataNascimento = data;
              }
            },
          ),
          const TextLabel(texto: "Nivel de experiência"),

        Column(
          children: niveis
            .map((nivel) => RadioListTile(
              dense: true,
              title: Text(nivel.toString()),
              selected: nivelSelecionado == nivel,
              value: nivel.toString(),
              groupValue: nivelSelecionado, 
              onChanged: (value) {
                setState(() {
                  nivelSelecionado = value.toString();  
                });
              },
            ))
            .toList(),),

          const TextLabel(texto: "Linguagens Preferidas"),

          Column(children:
          linguagens.map((linguagem) => CheckboxListTile(
            dense: true,
            title: Text(linguagem), 
            value: linguagensSelecionadas.contains(linguagem), 
            onChanged: (bool? value){
              if (value!) {
                setState(() {
                  linguagensSelecionadas.add(linguagem);
                });
              }else{
                setState(() {
                  linguagensSelecionadas.remove(linguagem);  
                });
              }
            })).toList() 
          ,),

          const TextLabel(texto: "Tempo de Experiência"),
          DropdownButton(
            value: tempoExperiencia,
            isExpanded: true,
            items:  returnItens(50),
            onChanged: (value){
              setState(() {
                tempoExperiencia = int.parse(value.toString());
              });
            }),

           TextLabel(texto: "Pretenção Salarial: R\$ ${salarioEscolhido.round().toString()}"),
           Slider(
            min: 0,
            max: 10000, 
            value: salarioEscolhido, 
            onChanged: (double value) {
              setState(() {
                salarioEscolhido = value;
              });
              }),

          TextButton(
            onPressed: () {
          },
          child: const Text("Salvar"),
          )
        ],
        ),
      ),
    );
  }
}