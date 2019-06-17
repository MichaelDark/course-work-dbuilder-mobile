import 'package:dbuilder_mobile/models/domain/company.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_entity.jser.dart';

class UserEntity {
  int id;
  bool enabled;

  String name;
  String surname;
  String username;

  bool isCompanyOwner;
  Company company;

  UserEntity({
    this.id,
    this.enabled,
    this.name,
    this.surname,
    this.username,
    this.isCompanyOwner,
    this.company,
  });
}

@GenSerializer()
class UserEntitySerializer extends Serializer<UserEntity>
    with _$UserEntitySerializer {}
