// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_criteria.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$NumberCriteriaSerializer
    implements Serializer<NumberCriteria> {
  @override
  Map<String, dynamic> toMap(NumberCriteria model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'maxValue', model.maxValue);
    setMapValue(ret, 'minValue', model.minValue);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'unit', model.unit);
    setMapValue(ret, 'createdAt', model.createdAt);
    setMapValue(ret, 'updatedAt', model.updatedAt);
    return ret;
  }

  @override
  NumberCriteria fromMap(Map map) {
    if (map == null) return null;
    final obj = new NumberCriteria();
    obj.id = map['id'] as int;
    obj.maxValue = map['maxValue'] as double;
    obj.minValue = map['minValue'] as double;
    obj.name = map['name'] as String;
    obj.unit = map['unit'] as String;
    obj.createdAt = map['createdAt'] as String;
    obj.updatedAt = map['updatedAt'] as String;
    return obj;
  }
}
