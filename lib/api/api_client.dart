import 'package:dbuilder_mobile/api/api_mixins/company_api.dart';
import 'package:dbuilder_mobile/models/domain/user_entity.dart';

import 'api_mixins/auth_api.dart';
import 'api_mixins/building_api.dart';
import 'api_mixins/building_task_api.dart';
import 'api_mixins/number_criteria_api.dart';
import 'api_mixins/number_value_api.dart';

abstract class IApiClient {
  String token;
  String get hostname;

  Future<void> updateUser();
  Future<Map<String, String>> getHeaders();
}

class ApiClient extends IApiClient
    with
        AuthApi,
        CompanyApi,
        BuildingApi,
        BuildingTaskApi,
        NumberCriteriaApi,
        NumberValueApi {
  static final ApiClient instance = ApiClient._();
  ApiClient._();
  factory ApiClient() => instance;

  UserEntity user;

  String get hostname => 'http://10.0.2.2:8080';

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  Future<void> updateUser() async {
    user = await getUserInfo();
  }
}
