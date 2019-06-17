import 'dart:convert';
import 'dart:math';

import 'package:dbuilder_mobile/models/domain/number_value.dart';
import 'package:dbuilder_mobile/models/requests/create_number_value_request.dart';
import 'package:dbuilder_mobile/models/response/status_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin NumberValueApi on IApiClient {
  Future<List<NumberValue>> getNumberValues(int buildingTaskId) async {
    http.Response response = await http.get(
      '$hostname/values/number/$buildingTaskId',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractList<NumberValue>(
        response, NumberValueSerializer());
  }

  Future<NumberValue> createNumberValue(
    int buildingTaskId,
    int numberCriteriaId, [
    double value,
  ]) async {
    double randomValue = Random().nextInt(4096) / 100;

    http.Response response = await http.post(
      '$hostname/values/number',
      headers: await getHeaders(),
      body: json.encode(
        CreateNumberValueRequestSerializer().toMap(
          CreateNumberValueRequest(
            buildingTaskId: buildingTaskId,
            numberCriteriaId: numberCriteriaId,
            value: value ?? randomValue,
          ),
        ),
      ),
    );

    return ResponseExtractor.extractItem<NumberValue>(
        response, NumberValueSerializer());
  }

  Future<StatusResponse> deleteNumberValue(
      int buildingTaskId, int numberCriteriaId) async {
    http.Response response = await http.delete(
      '$hostname/values/number/$buildingTaskId/$numberCriteriaId',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }

  Future<StatusResponse> deleteNumberValueById(int id) async {
    http.Response response = await http.delete(
      '$hostname/values/number/$id',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }
}
