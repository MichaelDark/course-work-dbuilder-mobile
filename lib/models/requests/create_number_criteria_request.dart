import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'create_number_criteria_request.jser.dart';

class CreateNumberCriteriaRequest {
  String name;
  String unit;
  double minValue;
  double maxValue;

  CreateNumberCriteriaRequest({
    this.name,
    this.unit,
    this.minValue,
    this.maxValue,
  });
}

@GenSerializer()
class CreateNumberCriteriaRequestSerializer
    extends Serializer<CreateNumberCriteriaRequest>
    with _$CreateNumberCriteriaRequestSerializer {}
