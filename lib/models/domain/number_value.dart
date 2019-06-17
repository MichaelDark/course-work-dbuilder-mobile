import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'number_value.jser.dart';

class NumberValue {
  int id;
  double value;
  NumberCriteria numberCriteria;

  String createdAt;
  String updatedAt;

  NumberValue({
    this.id,
    this.value,
    this.numberCriteria,
    this.createdAt,
    this.updatedAt,
  });

  bool get isValid =>
      value >= numberCriteria.minValue && value <= numberCriteria.maxValue;
}

@GenSerializer()
class NumberValueSerializer extends Serializer<NumberValue>
    with _$NumberValueSerializer {}
