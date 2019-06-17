// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BuildingSerializer implements Serializer<Building> {
  @override
  Map<String, dynamic> toMap(Building model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'buildingTasksCount', model.buildingTasksCount);
    setMapValue(ret, 'createdAt', model.createdAt);
    setMapValue(ret, 'updatedAt', model.updatedAt);
    return ret;
  }

  @override
  Building fromMap(Map map) {
    if (map == null) return null;
    final obj = new Building();
    obj.id = map['id'] as int;
    obj.name = map['name'] as String;
    obj.description = map['description'] as String;
    obj.buildingTasksCount = map['buildingTasksCount'] as int;
    obj.createdAt = map['createdAt'] as String;
    obj.updatedAt = map['updatedAt'] as String;
    return obj;
  }
}
