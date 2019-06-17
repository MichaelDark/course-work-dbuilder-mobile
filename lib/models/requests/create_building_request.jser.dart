// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_building_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateBuildingRequestSerializer
    implements Serializer<CreateBuildingRequest> {
  @override
  Map<String, dynamic> toMap(CreateBuildingRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    return ret;
  }

  @override
  CreateBuildingRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = new CreateBuildingRequest();
    obj.name = map['name'] as String;
    obj.description = map['description'] as String;
    return obj;
  }
}
