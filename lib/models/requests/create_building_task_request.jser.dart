// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_building_task_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateBuildingTaskRequestSerializer
    implements Serializer<CreateBuildingTaskRequest> {
  @override
  Map<String, dynamic> toMap(CreateBuildingTaskRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'dueDate', model.dueDate);
    return ret;
  }

  @override
  CreateBuildingTaskRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new CreateBuildingTaskRequest();
    obj.name = map['name'] as String;
    obj.dueDate = map['dueDate'] as String;
    return obj;
  }
}
