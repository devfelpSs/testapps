import 'package:flutter/material.dart';


class TarefaPage extends StatefulWidget {
  const TarefaPage({Key? key}) : super(key: key);

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();

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
                  
                  TextButton(onPressed: (){
                    print(descricaoController.text);
                    Navigator.pop(context);
                    }, child: const Text("Salvar")), //Botão de salvar e sem nenhuma operação ao ser pressionado
                ],
              );
          });
        },
      ),
      body: Container());
  }
}