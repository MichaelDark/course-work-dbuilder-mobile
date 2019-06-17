// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_value.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$NumberValueSerializer implements Serializer<NumberValue> {
  Serializer<NumberCriteria> __numberCriteriaSerializer;
  Serializer<NumberCriteria> get _numberCriteriaSerializer =>
      __numberCriteriaSerializer ??= new NumberCriteriaSerializer();
  @override
  Map<String, dynamic> toMap(NumberValue model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'value', model.value);
    setMapValue(ret, 'numberCriteria',
        _numberCriteriaSerializer.toMap(model.numberCriteria));
    setMapValue(ret, 'createdAt', model.createdAt);
    setMapValue(ret, 'updatedAt', model.updatedAt);
    return ret;
  }

  @override
  NumberValue fromMap(Map map) {
    if (map == null) return null;
    final obj = new NumberValue();
    obj.id = map['id'] as int;
    obj.value = map['value'] as double;
    obj.numberCriteria =
        _numberCriteriaSerializer.fromMap(map['numberCriteria'] as Map);
    obj.createdAt = map['createdAt'] as String;
    obj.updatedAt = map['updatedAt'] as String;
    return obj;
  }
}
