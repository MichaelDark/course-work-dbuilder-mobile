import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'create_building_request.jser.dart';

class CreateBuildingRequest {
  String name;
  String description;

  CreateBuildingRequest({
    this.name,
    this.description,
  });
}

@GenSerializer()
class CreateBuildingRequestSerializer extends Serializer<CreateBuildingRequest>
    with _$CreateBuildingRequestSerializer {}
