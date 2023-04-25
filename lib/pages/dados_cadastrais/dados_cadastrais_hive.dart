
import 'package:flutter/material.dart';
import 'package:testapp/model/dados_cadastrais_model.dart';
import 'package:testapp/repositories/linguagens_repository.dart';
import 'package:testapp/repositories/nivel_repository.dart';
import 'package:testapp/shared/widgets/text_label.dart';
import 'package:testapp/repositories/dados_cadastrais_repository.dart';

class DadosCadastraisHivePage extends StatefulWidget {

  const DadosCadastraisHivePage({Key ? key}) : super(key: key);

  @override
  State<DadosCadastraisHivePage> createState() =>
  _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();

  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  //DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepoistory = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  //List<String> linguagensSelecionadas = [];
  //var nivelSelecionado = "";
  //int tempoExperiencia = 0;
  //double salarioEscolhido = 0;

  bool salvando = false;


@override void initState() {
    // ignore: todo
    // TODO: implement initState
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepoistory.retornaLinguagens();
    super.initState();
    carregarDados();
  }

//carrega os dados salvos anteriormente:
  carregarDados() async { 
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null ? "" : dadosCadastraisModel.dataNascimento.toString();
    setState(() {
      
    });
  }
//

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
        child: salvando ? const Center(child: CircularProgressIndicator()) : ListView(
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
                firstDate: DateTime(1970,1,1), 
                lastDate: DateTime(2023,10,23));
              if (data != null){
                dataNascimentoController.text = data.toString();
                dadosCadastraisModel.dataNascimento = data;
              }
            },
          ),
          const TextLabel(texto: "Nivel de experiência"),

        Column(
          children: niveis
            .map((nivel) => RadioListTile(
              dense: true,
              title: Text(nivel.toString()),
              selected: dadosCadastraisModel.nivelExperiencia == nivel,
              value: nivel.toString(),
              groupValue: dadosCadastraisModel.nivelExperiencia, 
              onChanged: (value) {
                setState(() {
                  dadosCadastraisModel.nivelExperiencia = value.toString();  
                });
              },
            ))
            .toList(),),

          const TextLabel(texto: "Linguagens Preferidas"),

          Column(children:
          linguagens.map((linguagem) => CheckboxListTile(
            dense: true,
            title: Text(linguagem), 
            value: dadosCadastraisModel.linguagens.contains(linguagem), 
            onChanged: (bool? value){
              if (value!) {
                setState(() {
                  dadosCadastraisModel.linguagens.add(linguagem);
                });
              }else{
                setState(() {
                  dadosCadastraisModel.linguagens.remove(linguagem);  
                });
              }
            })).toList() 
          ,),

          const TextLabel(texto: "Tempo de Experiência"),
          DropdownButton(
            value: dadosCadastraisModel.tempoExperiencia,
            isExpanded: true,
            items:  returnItens(50),
            onChanged: (value){
              setState(() {
                dadosCadastraisModel.tempoExperiencia = int.parse(value.toString());
              });
            }),

           TextLabel(texto: "Pretenção Salarial: R\$ ${dadosCadastraisModel.salario?.round().toString()}"),
           Slider(
            min: 0,
            max: 10000, 
            value: dadosCadastraisModel.salario ?? 0, 
            onChanged: (double value) {
              setState(() {
                dadosCadastraisModel.salario = value;
              });
              }),

          TextButton(
            onPressed: () async {
              setState(() {
                salvando = false;
              });
              if (nomeController.text.trim().length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("O nome deve ser preenchido")));
                  return;
              }
              if (dadosCadastraisModel.dataNascimento == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Data de Nascimento inválida")));
                  return;
              }
              if (dadosCadastraisModel.nivelExperiencia == null || 
              dadosCadastraisModel.nivelExperiencia!.trim() == '') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("O nível deve ser selecionado")));
                  return;
              }
              if (dadosCadastraisModel.linguagens.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deve ser selecionado ao menos 1 linguagem")));
                  return;
              }
              if (dadosCadastraisModel.tempoExperiencia == null || dadosCadastraisModel.tempoExperiencia == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deve ter ao menos 1 ano de experiência")));
                  return;
              }

              if (dadosCadastraisModel.salario == null || dadosCadastraisModel.salario == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("A pretenção salarial deve ser maior que 0")));
                  return;
              }
            //SALVANDO ESTADO ATUAL COM AS CHAVES:
              setState(() {
                  salvando = true;
                });
            ////

              Future.delayed(const Duration(seconds: 3), (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Dados salvo com sucesso")));
                setState(() {
                  salvando = false;
                });
                Navigator.pop(context);
              });
          },
          child: const Text("Salvar"),
          )
        ],
        ),
      ),
    );
  }
}