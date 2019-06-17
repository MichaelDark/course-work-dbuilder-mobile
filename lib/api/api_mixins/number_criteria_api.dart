import 'dart:convert';
import 'dart:math';

import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
import 'package:dbuilder_mobile/models/requests/create_number_criteria_request.dart';
import 'package:dbuilder_mobile/models/response/status_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin NumberCriteriaApi on IApiClient {
  Future<List<NumberCriteria>> getNumberCriterion() async {
    http.Response response = await http.get(
      '$hostname/numberCriteria/all',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractList<NumberCriteria>(
        response, NumberCriteriaSerializer());
  }

  Future<NumberCriteria> createNumberCriteria() async {
    int min = Random().nextInt(256);
    int max = min + Random().nextInt(256);

    http.Response response = await http.post(
      '$hostname/numberCriteria/create',
      headers: await getHeaders(),
      body: json.encode(
        CreateNumberCriteriaRequestSerializer().toMap(
          CreateNumberCriteriaRequest(
            name: 'Number Criteria ${Random().nextInt(255)}',
            minValue: min.toDouble(),
            maxValue: max.toDouble(),
            unit: "Unit " + Random().nextInt(256).toString(),
          ),
        ),
      ),
    );

    return ResponseExtractor.extractItem<NumberCriteria>(
        response, NumberCriteriaSerializer());
  }

  Future<StatusResponse> deleteNumberCriteria(int numberCtiretiaId) async {
    http.Response response = await http.delete(
      '$hostname/numberCriteria/delete/$numberCtiretiaId',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }
}
