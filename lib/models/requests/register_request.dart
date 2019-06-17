import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'register_request.jser.dart';

class RegisterRequest {
  String username;
  String password;

  String name;
  String surname;
  bool isCompanyOwner;

  RegisterRequest({
    this.username,
    this.password,
    this.name,
    this.surname,
    this.isCompanyOwner,
  });
}

@GenSerializer()
class RegisterRequestSerializer extends Serializer<RegisterRequest>
    with _$RegisterRequestSerializer {}
