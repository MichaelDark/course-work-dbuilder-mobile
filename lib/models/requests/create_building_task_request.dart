import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'create_building_task_request.jser.dart';

class CreateBuildingTaskRequest {
  String name;
  String dueDate;

  CreateBuildingTaskRequest({
    this.name,
    this.dueDate,
  });
}

@GenSerializer()
class CreateBuildingTaskRequestSerializer
    extends Serializer<CreateBuildingTaskRequest>
    with _$CreateBuildingTaskRequestSerializer {}
