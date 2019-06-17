import 'dart:convert';
import 'dart:math';

import 'package:dbuilder_mobile/localization/date_format.dart';
import 'package:dbuilder_mobile/models/domain/building_task.dart';
import 'package:dbuilder_mobile/models/requests/create_building_task_request.dart';
import 'package:dbuilder_mobile/models/response/status_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin BuildingTaskApi on IApiClient {
  Future<List<BuildingTask>> getBuildingTasks(int buildingId) async {
    http.Response response = await http.get(
      '$hostname/buildingTasks/$buildingId',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractList<BuildingTask>(
        response, BuildingTaskSerializer());
  }

  Future<BuildingTask> createBuildingTask(int buildingId) async {
    http.Response response = await http.post(
      '$hostname/buildingTask/create/$buildingId',
      headers: await getHeaders(),
      body: json.encode(
        CreateBuildingTaskRequestSerializer().toMap(
          CreateBuildingTaskRequest(
            name: 'My building Task ${Random().nextInt(255)}',
            dueDate:
                DateFormat().formatDate(DateTime.now().add(Duration(days: 31))),
          ),
        ),
      ),
    );

    return ResponseExtractor.extractItem<BuildingTask>(
        response, BuildingTaskSerializer());
  }

  Future<StatusResponse> deleteBuildingTask(int buildingTaskId) async {
    http.Response response = await http.delete(
      '$hostname/buildingTask/delete/$buildingTaskId',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }
}
