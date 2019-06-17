import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'create_number_value_request.jser.dart';

class CreateNumberValueRequest {
  int buildingTaskId;
  int numberCriteriaId;
  double value;

  CreateNumberValueRequest({
    this.buildingTaskId,
    this.numberCriteriaId,
    this.value,
  });
}

@GenSerializer()
class CreateNumberValueRequestSerializer
    extends Serializer<CreateNumberValueRequest>
    with _$CreateNumberValueRequestSerializer {}
