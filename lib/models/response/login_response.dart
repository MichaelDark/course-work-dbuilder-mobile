import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'login_response.jser.dart';

class LoginResponse {
  String token;

  LoginResponse({
    this.token,
  });
}

@GenSerializer()
class LoginResponseSerializer extends Serializer<LoginResponse>
    with _$LoginResponseSerializer {}
