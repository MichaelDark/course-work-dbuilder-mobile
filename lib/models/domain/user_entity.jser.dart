// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserEntitySerializer implements Serializer<UserEntity> {
  Serializer<Company> __companySerializer;
  Serializer<Company> get _companySerializer =>
      __companySerializer ??= new CompanySerializer();
  @override
  Map<String, dynamic> toMap(UserEntity model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'enabled', model.enabled);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'surname', model.surname);
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'isCompanyOwner', model.isCompanyOwner);
    setMapValue(ret, 'company', _companySerializer.toMap(model.company));
    return ret;
  }

  @override
  UserEntity fromMap(Map map) {
    if (map == null) return null;
    final obj = new UserEntity();
    obj.id = map['id'] as int;
    obj.enabled = map['enabled'] as bool;
    obj.name = map['name'] as String;
    obj.surname = map['surname'] as String;
    obj.username = map['username'] as String;
    obj.isCompanyOwner = map['isCompanyOwner'] as bool;
    obj.company = _companySerializer.fromMap(map['company'] as Map);
    return obj;
  }
}
