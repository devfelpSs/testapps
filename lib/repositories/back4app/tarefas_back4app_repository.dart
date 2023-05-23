import 'package:dio/dio.dart';
import 'package:testapp/model/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {
  var _dio = Dio();

  TarefasBack4AppRepository(){
    _dio.options.headers["X-Parse-Application-Id"] = "162zcyYYdQIU1ZPoT8CPKWN0bmH6r33ikY9DkoZU";
    _dio.options.headers["X-Parse-REST-API-Key"] = "CwcgU5pb7yA1nCaxva7KldFl6VS0u9WAPWqIA1IR";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] = "162zcyYYdQIU1ZPoT8CPKWN0bmH6r33ikY9DkoZU";
    dio.options.headers["X-Parse-REST-API-Key"] = "CwcgU5pb7yA1nCaxva7KldFl6VS0u9WAPWqIA1IR";
    dio.options.headers["Content-Type"] = "application/json";
    var url = "/Tarefas";
    if (naoConcluidas){
      url = "$url?where={\"concluido\":false}";
    }
    var result = await _dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.post("/Tarefas", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }   
  }
  
  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.put("/Tarefas/${tarefaBack4AppModel.objectId}", data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await _dio.delete("/Tarefas/$objectId");
    } catch (e) {
      throw e;
    }
  }

}