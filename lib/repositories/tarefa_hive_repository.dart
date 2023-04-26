import 'package:hive/hive.dart';
import 'package:testapp/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
    static late Box _box;

    TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastraisModel')) {
      _box = Hive.box('dadosCadastraisModel');
    } else {
      _box = await Hive.openBox('dadosCadastraisModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModelo tarefaHiveModelo) {
    _box.add(tarefaHiveModelo);
  }

  List<TarefaHiveModelo> obterDados() {
    return _box.values.cast<TarefaHiveModelo>().toList();
  }

}