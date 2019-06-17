// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$StatusResponseSerializer
    implements Serializer<StatusResponse> {
  @override
  Map<String, dynamic> toMap(StatusResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'message', model.message);
    setMapValue(ret, 'status', model.status);
    return ret;
  }

  @override
  StatusResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = new StatusResponse();
    obj.message = map['message'] as String;
    obj.status = map['status'] as String;
    return obj;
  }
}
