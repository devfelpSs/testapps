// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TarefaHiveModeloAdapter extends TypeAdapter<TarefaHiveModelo> {
  @override
  final int typeId = 1;

  @override
  TarefaHiveModelo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TarefaHiveModelo()
      ..descricao = fields[0] as String
      ..concluido = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, TarefaHiveModelo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.descricao)
      ..writeByte(1)
      ..write(obj.concluido);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarefaHiveModeloAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
