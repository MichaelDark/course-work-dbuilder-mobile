import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'status_response.jser.dart';

class StatusResponse {
  String message;
  String status;

  StatusResponse({
    this.message,
    this.status,
  });
}

@GenSerializer()
class StatusResponseSerializer extends Serializer<StatusResponse>
    with _$StatusResponseSerializer {}
