import 'package:flutter/material.dart';
import 'package:testapp/model/tarefa_hive_model.dart';

import '../../repositories/tarefa_hive_repository.dart';


class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  late TarefaHiveRepository tarefaRepository;
  var _tarefas = const <TarefaHiveModelo>[];
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState(){
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaRepository = await TarefaHiveRepository.carregar();
    //if(apenasNaoConcluidos){
    //_tarefas = await tarefaRepository.listarNaoConcluidas();
    //}else{
      _tarefas = tarefaRepository.obterDados();
    //}
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          descricaoController.text = "";
          showDialog(
            context: context,
            builder: (BuildContext bc){
              return AlertDialog(
                title: const Text("Adicionar Tarefa"),
                content: TextField(controller: descricaoController,),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context); //Cancela a operação
                    }, 
                    child: const Text("Cancelar")), //Botão de cancelar
                  
                  TextButton(
                    onPressed: ()async {
                    await tarefaRepository.salvar(
                      TarefaHiveModelo.criar(descricaoController.text, false));
                    Navigator.pop(context);
                    obterTarefas();
                    setState(() {});
                    }, child: const Text("Salvar")), //Botão de salvar e sem nenhuma operação ao ser pressionado
                ],
              );
          });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Apenas não concluidos", style: TextStyle(fontSize: 18),),
                  Switch(value: apenasNaoConcluidos, onChanged: (bool value){
                    apenasNaoConcluidos = value;
                    obterTarefas();
                    })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index){
                  var tarefa = _tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                     //await tarefaRepository.remove(tarefa.id);
                     obterTarefas();
                    },
                    key: Key(tarefa.descricao),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(onChanged: (bool value) async {
                        //await tarefaRepository.alterar(tarefa.id, value);
                        obterTarefas();
                      }, 
                      value: tarefa.concluido),
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ));
  }
}