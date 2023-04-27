import 'package:flutter/material.dart';
import 'package:testapp/model/tarefa.dart';
import 'package:testapp/model/tarefa_hive_model.dart';
import 'package:testapp/model/tarefa_sqlite_model.dart';
import 'package:testapp/repositories/sqlite/tarefa_sqlite_repository.dart';

import '../../repositories/tarefa_hive_repository.dart';
import '../../repositories/tarefa_repository.dart';


class TarefaSQLitePage extends StatefulWidget {
  const TarefaSQLitePage({Key? key}) : super(key: key);

  @override
  State<TarefaSQLitePage> createState() => _TarefaSQLitePageState();
}

class _TarefaSQLitePageState extends State<TarefaSQLitePage> {
  TarefaSQLiteRepository tarefaRepository = TarefaSQLiteRepository();
  var _tarefas = const <TarefaSQLiteModel>[];
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState(){
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
      _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
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
                      TarefaSQLiteModel(0, descricaoController.text, false));
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
                     tarefaRepository.remover(tarefa.id);
                     obterTarefas();
                    },
                    key: Key(tarefa.descricao),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(onChanged: (bool value) async {
                        tarefa.concluido = value;
                        tarefaRepository.atualizar(tarefa);
                        obterTarefas();
                      }, 
                      value: tarefa.concluido
                      ),
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