// GENERATED CODE - DO NOT MODIFY BY HAND
/*
part of 'graph_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GraphInfoAdapter extends TypeAdapter<GraphInfo> {
  @override
  final int typeId = 0;

  @override
  GraphInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GraphInfo(
      data: (fields[0] as List).cast<FlSpot>(),
      avgY: fields[1] as double,
      peakY: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GraphInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.avgY)
      ..writeByte(2)
      ..write(obj.peakY);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
*/