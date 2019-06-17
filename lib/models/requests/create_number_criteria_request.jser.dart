// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_number_criteria_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateNumberCriteriaRequestSerializer
    implements Serializer<CreateNumberCriteriaRequest> {
  @override
  Map<String, dynamic> toMap(CreateNumberCriteriaRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'unit', model.unit);
    setMapValue(ret, 'minValue', model.minValue);
    setMapValue(ret, 'maxValue', model.maxValue);
    return ret;
  }

  @override
  CreateNumberCriteriaRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new CreateNumberCriteriaRequest();
    obj.name = map['name'] as String;
    obj.unit = map['unit'] as String;
    obj.minValue = map['minValue'] as double;
    obj.maxValue = map['maxValue'] as double;
    return obj;
  }
}
