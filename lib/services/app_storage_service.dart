import 'package:shared_preferences/shared_preferences.dart';

//STORAGE DE CHAVES PARA OS 2 ARQUIVOS DO APP:
  enum STORAGE_CHAVES { 
    CHAVE_DADOS_CADASTRAIS_NOME, 
    CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
    CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
    CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
    CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
    CHAVE_DADOS_CADASTRAIS_SALARIO,
    CHAVE_NOME_USUARIO,
    CHAVE_ALTURA,
    CHAVE_RECEBER_NOTIFICACOES,
    CHAVE_TEMA_ESCURO,
    CHAVE_NUMERO_ALEATORIO,
    CHAVE_QUANTIDADE_CLIQUES
  }
//
class AppStorageService {

//CHAVES PARA O ARQUIVO: "dados_cadastrais.dart"
 Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
     await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(), data.toString());
  }

  Future<String> getDadosCadastraisDataNascimento() async {
     return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  Future<void> setDadosCadastraisNivelExperiencia(String value) async {
      await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(), value);
  }

  Future<String> getDadosCadastraisNivelExperiencia() async {
     return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  Future<void> setDadosCadastraisLinguagens(List<String> values) async {
    await _setStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(), values);
  }

  Future<List<String>> getDadosCadastraisLinguagens() async {
    return _getStringList(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  Future<void> setDadosCadastraisTempoExperiencia(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(), value);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  Future<void> setDadosCadastraisSalario(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), value);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }
//

//CHAVES PARA O ARQUIVO: "configuracoes_page.dart"

    Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

   Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  Future<void> setConfiguracoesReceberNotificacao(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(), value);
  }

  Future<bool> getConfiguracoeReceberNotificacao() async {
    return _getBool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }

  Future<void> setConfiguracoesTemaEScuro(bool value) async {
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), value);
  }

  Future<bool> getConfiguracoeReceberTemaEscuro() async {
    return _getBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString());
  }
//


  Future<void> setNumeroAleatorio(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), value);
  }

  Future<int> getNumeroAleatorio() async {
    return _getInt(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }

  Future<void> setQuantidadeCliques(int value) async {
    await _setInt(STORAGE_CHAVES.CHAVE_QUANTIDADE_CLIQUES.toString(), value);
  }

  Future<int> getQuantidadeCliques() async {
    return _getInt(STORAGE_CHAVES.CHAVE_QUANTIDADE_CLIQUES.toString());
  }

//CRIANDO WRAP DE CHAVES PARA AS CHAVES ACIMA:

//TIPO STRING:
   _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }
//

//TIPO STRING LIST (LISTA DE STRINGS):
  _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }
//

//TIPO INTEIRO:
  _setInt(String chave,  value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }
  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }
//

//TIPO DOUBLE:
  _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }
  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
//

//TIPO BOOLEANO:
   _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
//

}