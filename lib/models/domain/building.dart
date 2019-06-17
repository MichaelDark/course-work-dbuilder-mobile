import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'building.jser.dart';

class Building {
  int id;
  String name;
  String description;
  int buildingTasksCount;

  String createdAt;
  String updatedAt;

  Building({
    this.id,
    this.name,
    this.description,
    this.buildingTasksCount,
    this.createdAt,
    this.updatedAt,
  });
}

@GenSerializer()
class BuildingSerializer extends Serializer<Building>
    with _$BuildingSerializer {}
