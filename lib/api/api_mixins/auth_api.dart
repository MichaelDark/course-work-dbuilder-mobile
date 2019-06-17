import 'dart:convert';
import 'package:dbuilder_mobile/models/domain/user_entity.dart';
import 'package:dbuilder_mobile/models/requests/login_request.dart';
import 'package:dbuilder_mobile/models/response/login_response.dart';
import 'package:http/http.dart' as http;

import '../api_client.dart';
import '../response_extractor.dart';

mixin AuthApi on IApiClient {
  Future<UserEntity> getUserInfo() async {
    http.Response response = await http.get(
      '$hostname/userInfo',
      headers: await getHeaders(),
    );

    return ResponseExtractor.extractItem<UserEntity>(
        response, UserEntitySerializer());
  }

  Future<LoginResponse> login(LoginRequest request) async {
    http.Response response = await http.post(
      '$hostname/login',
      body: json.encode(LoginRequestSerializer().toMap(request)),
      headers: await getHeaders(),
    );

    LoginResponse resp = await ResponseExtractor.extractItem<LoginResponse>(
        response, LoginResponseSerializer());
    token = resp.token;
    await updateUser();

    return resp;
  }
}
