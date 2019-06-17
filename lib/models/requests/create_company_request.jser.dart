// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_company_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateCompanyRequestSerializer
    implements Serializer<CreateCompanyRequest> {
  @override
  Map<String, dynamic> toMap(CreateCompanyRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    return ret;
  }

  @override
  CreateCompanyRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new CreateCompanyRequest();
    obj.name = map['name'] as String;
    obj.description = map['description'] as String;
    return obj;
  }
}
