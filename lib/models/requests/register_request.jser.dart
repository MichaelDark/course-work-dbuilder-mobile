// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$RegisterRequestSerializer
    implements Serializer<RegisterRequest> {
  @override
  Map<String, dynamic> toMap(RegisterRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'username', model.username);
    setMapValue(ret, 'password', model.password);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'surname', model.surname);
    setMapValue(ret, 'isCompanyOwner', model.isCompanyOwner);
    return ret;
  }

  @override
  RegisterRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new RegisterRequest();
    obj.username = map['username'] as String;
    obj.password = map['password'] as String;
    obj.name = map['name'] as String;
    obj.surname = map['surname'] as String;
    obj.isCompanyOwner = map['isCompanyOwner'] as bool;
    return obj;
  }
}
