import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'company.jser.dart';

class Company {
  int id;
  String name;
  String description;

  String createdAt;
  String updatedAt;

  Company({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}

@GenSerializer()
class CompanySerializer extends Serializer<Company> with _$CompanySerializer {}
