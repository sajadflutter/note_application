// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 5;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.Workind;
      case 1:
        return TaskTypeEnum.date;
      case 2:
        return TaskTypeEnum.sport;
      case 3:
        return TaskTypeEnum.foucos;
      default:
        return TaskTypeEnum.Workind;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.Workind:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.date:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.sport:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.foucos:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
