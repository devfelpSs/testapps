import 'package:flutter/material.dart';
import 'package:testapp/model/tarefa_sqlite_model.dart';
import 'package:testapp/model/tarefas_back4app_model.dart';
import 'package:testapp/repositories/back4app/tarefas_back4app_repository.dart';



class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({Key? key}) : super(key: key);

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState(){
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      var carregando = true;
    });
      _tarefasBack4App = await tarefaRepository.obterTarefas(apenasNaoConcluidos);
    setState(() {
      carregando = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarefas HTTP"),),
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
                    await tarefaRepository.criar(
                      TarefaBack4AppModel.criar(
                        descricaoController.text, false
                      ));
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
            carregando ? const CircularProgressIndicator() : Expanded(
              child: ListView.builder(
                itemCount: _tarefasBack4App.tarefas.length,
                itemBuilder: (BuildContext bc, int index){
                  var tarefa = _tarefasBack4App.tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                     //tarefaRepository.remover(tarefa.id);
                     obterTarefas();
                    },
                    key: Key(tarefa.descricao),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(onChanged: (bool value) async {
                        tarefa.concluido = value;
                        //tarefaRepository.atualizar(tarefa);
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