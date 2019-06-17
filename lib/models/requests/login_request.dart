import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'login_request.jser.dart';

class LoginRequest {
  String password;
  String username;

  LoginRequest({
    this.password,
    this.username,
  });
}

@GenSerializer()
class LoginRequestSerializer extends Serializer<LoginRequest>
    with _$LoginRequestSerializer {}
