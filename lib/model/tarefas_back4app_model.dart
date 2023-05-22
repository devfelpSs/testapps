class TarefasBack4AppModel {
  List<Tarefa>? results;

  TarefasBack4AppModel({this.results});

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Tarefa>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tarefa {
  String? objectId;
  String? descricao;
  bool? concluido;
  String? createdAt;
  String? updatedAt;

  Tarefa(
      {this.objectId,
      this.descricao,
      this.concluido,
      this.createdAt,
      this.updatedAt});

  Tarefa.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['descricao'] = this.descricao;
    data['concluido'] = this.concluido;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
