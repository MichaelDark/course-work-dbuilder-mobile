import 'dart:convert';
import 'dart:math';

import 'package:dbuilder_mobile/models/domain/company.dart';
import 'package:dbuilder_mobile/models/requests/create_company_request.dart';
import 'package:dbuilder_mobile/models/response/status_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin CompanyApi on IApiClient {
  Future<Company> getCompany() async {
    http.Response response = await http.get(
      '$hostname/company',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<Company>(
        response, CompanySerializer());
  }

  Future<Company> createCompany() async {
    http.Response response = await http.post(
      '$hostname/company/create',
      headers: await getHeaders(),
      body: json.encode(
        CreateCompanyRequestSerializer().toMap(
          CreateCompanyRequest(
            name: 'My Company ${Random().nextInt(255)}',
            description: 'Company description',
          ),
        ),
      ),
    );

    await updateUser();

    return ResponseExtractor.extractItem<Company>(
        response, CompanySerializer());
  }

  Future<StatusResponse> deleteCompany() async {
    http.Response response = await http.delete(
      '$hostname/company/delete',
      headers: await getHeaders(),
    );

    await updateUser();

    return ResponseExtractor.extractItem<StatusResponse>(
        response, StatusResponseSerializer());
  }
}
