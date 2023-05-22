import 'package:dio/dio.dart';
import 'package:testapp/model/tarefas_back4app_model.dart';

class TarefasBack4AppRepository {
  Future<TarefasBack4AppModel> obterTarefas() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] = "162zcyYYdQIU1ZPoT8CPKWN0bmH6r33ikY9DkoZU";
    dio.options.headers["X-Parse-REST-API-Key"] = "CwcgU5pb7yA1nCaxva7KldFl6VS0u9WAPWqIA1IR";
    dio.options.headers["Content-Type"] = "application/json";
    var result = await dio.get("https://parseapi.back4app.com/classes/Tarefas");
    return TarefasBack4AppModel.fromJson(result.data);
  }
}