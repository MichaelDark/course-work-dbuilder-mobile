import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'building_task.jser.dart';

class BuildingTask {
  int id;
  String name;
  String dueDate;

  String createdAt;
  String updatedAt;

  BuildingTask({
    this.id,
    this.name,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });
}

@GenSerializer()
class BuildingTaskSerializer extends Serializer<BuildingTask>
    with _$BuildingTaskSerializer {}
