import '../model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionart(Tarefa tarefa)async{
    await Future.delayed(const Duration(microseconds: 100));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido)async{
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas
      .where((tarefa) => tarefa.getId() == id)
      .first
      .setConcluido(concluido);
  }

  Future<List<Tarefa>> listar() async{
    Future.delayed(const Duration(microseconds: 100));
    return _tarefas;
  }
  
  Future<List<Tarefa>> listarNaoConcluidas() async{
    Future.delayed(const Duration(microseconds: 100));
    return _tarefas.where((tarefa) => !tarefa.getConcluido()).toList();
  }
}