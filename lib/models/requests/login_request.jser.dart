// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginRequestSerializer implements Serializer<LoginRequest> {
  @override
  Map<String, dynamic> toMap(LoginRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'password', model.password);
    setMapValue(ret, 'username', model.username);
    return ret;
  }

  @override
  LoginRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new LoginRequest();
    obj.password = map['password'] as String;
    obj.username = map['username'] as String;
    return obj;
  }
}
