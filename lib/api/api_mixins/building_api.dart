import 'dart:convert';
import 'dart:math';

import 'package:dbuilder_mobile/models/domain/building.dart';
import 'package:dbuilder_mobile/models/requests/create_building_request.dart';
import 'package:dbuilder_mobile/models/response/status_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin BuildingApi on IApiClient {
  Future<List<Building>> getBuildings() async {
    http.Response response = await http.get(
      '$hostname/buildings',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractList<Building>(
        response, BuildingSerializer());
  }

  Future<Building> createBuilding() async {
    http.Response response = await http.post(
      '$hostname/building/create',
      headers: await getHeaders(),
      body: json.encode(
        CreateBuildingRequestSerializer().toMap(
          CreateBuildingRequest(
            name: 'My building ${Random().nextInt(255)}',
            description: 'Building description',
          ),
        ),
      ),
    );

    return ResponseExtractor.extractItem<Building>(
        response, BuildingSerializer());
  }

  Future<StatusResponse> deleteBuilding(int buildingId) async {
    http.Response response = await http.delete(
      '$hostname/building/delete/$buildingId',
      headers: await getHeaders(),
    );

    await updateUser();

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }
}
