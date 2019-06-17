// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginResponseSerializer implements Serializer<LoginResponse> {
  @override
  Map<String, dynamic> toMap(LoginResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'token', model.token);
    return ret;
  }

  @override
  LoginResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = new LoginResponse();
    obj.token = map['token'] as String;
    return obj;
  }
}
