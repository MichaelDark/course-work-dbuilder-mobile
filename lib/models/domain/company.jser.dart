// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CompanySerializer implements Serializer<Company> {
  @override
  Map<String, dynamic> toMap(Company model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'createdAt', model.createdAt);
    setMapValue(ret, 'updatedAt', model.updatedAt);
    return ret;
  }

  @override
  Company fromMap(Map map) {
    if (map == null) return null;
    final obj = new Company();
    obj.id = map['id'] as int;
    obj.name = map['name'] as String;
    obj.description = map['description'] as String;
    obj.createdAt = map['createdAt'] as String;
    obj.updatedAt = map['updatedAt'] as String;
    return obj;
  }
}
