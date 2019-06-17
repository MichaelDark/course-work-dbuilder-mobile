import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'number_criteria.jser.dart';

class NumberCriteria {
  int id;
  double maxValue;
  double minValue;
  String name;
  String unit;

  String createdAt;
  String updatedAt;

  NumberCriteria({
    this.id,
    this.maxValue,
    this.minValue,
    this.name,
    this.unit,
    this.createdAt,
    this.updatedAt,
  });
}

@GenSerializer()
class NumberCriteriaSerializer extends Serializer<NumberCriteria>
    with _$NumberCriteriaSerializer {}
