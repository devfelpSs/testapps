import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testapp/model/dados_cadastrais_model.dart';
import 'package:testapp/model/tarefa_hive_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModeloAdapter());
  runApp(const MyApp());
}



