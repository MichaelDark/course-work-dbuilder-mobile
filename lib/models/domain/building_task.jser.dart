// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_task.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BuildingTaskSerializer implements Serializer<BuildingTask> {
  @override
  Map<String, dynamic> toMap(BuildingTask model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'dueDate', model.dueDate);
    setMapValue(ret, 'createdAt', model.createdAt);
    setMapValue(ret, 'updatedAt', model.updatedAt);
    return ret;
  }

  @override
  BuildingTask fromMap(Map map) {
    if (map == null) return null;
    final obj = new BuildingTask();
    obj.id = map['id'] as int;
    obj.name = map['name'] as String;
    obj.dueDate = map['dueDate'] as String;
    obj.createdAt = map['createdAt'] as String;
    obj.updatedAt = map['updatedAt'] as String;
    return obj;
  }
}
