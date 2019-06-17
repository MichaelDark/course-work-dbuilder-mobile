import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'api_client_exception.jser.dart';

class ApiClientException {}

@GenSerializer()
class ApiClientSerializer extends Serializer<ApiClientException>
    with _$ApiClientSerializer {}
