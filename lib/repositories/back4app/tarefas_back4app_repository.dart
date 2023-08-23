import 'package:dio/dio.dart';
import 'package:testapp/model/tarefas_back4app_model.dart';
import 'package:testapp/repositories/back4app/back4app_dio.dart';

class TarefasBack4AppRepository {
  final _customDio = Back4appCustomDio();

  TarefasBack4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var dio = Dio();
    var url = "/Tarefas";
    if (naoConcluidas){
      url = "$url?where={\"concluido\":false}";
    }
    var result = await _customDio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.post("/Tarefas", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }   
  }
  
  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _customDio.dio.put("/Tarefas/${tarefaBack4AppModel.objectId}", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _customDio.dio.delete("/Tarefas/$objectId");
    } catch (e) {
      rethrow;
    }
  }

}