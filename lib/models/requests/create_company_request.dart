import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'create_company_request.jser.dart';

class CreateCompanyRequest {
  String name;
  String description;

  CreateCompanyRequest({
    this.name,
    this.description,
  });
}

@GenSerializer()
class CreateCompanyRequestSerializer extends Serializer<CreateCompanyRequest>
    with _$CreateCompanyRequestSerializer {}
