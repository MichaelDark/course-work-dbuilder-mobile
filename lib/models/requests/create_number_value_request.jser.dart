// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_number_value_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateNumberValueRequestSerializer
    implements Serializer<CreateNumberValueRequest> {
  @override
  Map<String, dynamic> toMap(CreateNumberValueRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'buildingTaskId', model.buildingTaskId);
    setMapValue(ret, 'numberCriteriaId', model.numberCriteriaId);
    setMapValue(ret, 'value', model.value);
    return ret;
  }

  @override
  CreateNumberValueRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new CreateNumberValueRequest();
    obj.buildingTaskId = map['buildingTaskId'] as int;
    obj.numberCriteriaId = map['numberCriteriaId'] as int;
    obj.value = map['value'] as double;
    return obj;
  }
}
