// import 'package:chopper/chopper.dart';
// import 'package:dbuilder_mobile/models/domain/building.dart';
// import 'package:dbuilder_mobile/models/domain/building_task.dart';
// import 'package:dbuilder_mobile/models/domain/company.dart';
// import 'package:dbuilder_mobile/models/domain/number_criteria.dart';
// import 'package:dbuilder_mobile/models/domain/number_value.dart';
// import 'package:dbuilder_mobile/models/domain/user_entity.dart';
// import 'package:dbuilder_mobile/models/requests/create_building_request.dart';
// import 'package:dbuilder_mobile/models/requests/create_building_task_request.dart';
// import 'package:dbuilder_mobile/models/requests/create_company_request.dart';
// import 'package:dbuilder_mobile/models/requests/create_number_criteria_request.dart';
// import 'package:dbuilder_mobile/models/requests/create_number_value_request.dart';
// import 'package:dbuilder_mobile/models/requests/login_request.dart';
// import 'package:dbuilder_mobile/models/requests/register_request.dart';
// import 'package:dbuilder_mobile/models/response/login_response.dart';
// import 'package:dbuilder_mobile/models/response/status_reponse.dart';

// part 'api_service.chopper.dart';

// @ChopperApi()
// abstract class ApiService extends ChopperService {
//   static ApiService create([ChopperClient client]) => _$ApiService(client);

//   /// User

//   @Post(path: "register")
//   Future<Response<UserEntity>> register(@Body() RegisterRequest request);

//   @Post(path: "register/company")
//   Future<Response<UserEntity>> registerComanyUser(@Body() RegisterRequest request);

//   /// Company

//   @Get(path: "company/users")
//   Future<Response<List<UserEntity>>> getCompanyUsers();

//   /// Building Task

//   @Get(path: "buildingTasks/{buildingId}")
//   Future<Response<List<BuildingTask>>> getBuildingTasks(@Path() String buildingId);

//   @Post(path: "building/create/{buildingId}")
//   Future<Response<Building>> createBuidlingTask(@Path() String buildingId, @Body() CreateBuildingTaskRequest request);

//   @Delete(path: "building/delete/{buildingTaskId}")
//   Future<Response<StatusResponse>> deleteBuildingTask(@Path() String buildingTaskId);

//   /// Number Criteria

//   @Get(path: "numberCriteria/all")
//   Future<Response<List<NumberCriteria>>> getNumberCriterion();

//   @Post(path: "numberCriteria/create")
//   Future<Response<NumberCriteria>> createNumberCriteria( @Body() CreateNumberCriteriaRequest request);

//   @Delete(path: "building/delete/{numberCriteriaId}")
//   Future<Response<StatusResponse>> deleteNumberCriteria(@Path() String numberCriteriaId);

//   /// Number Value

//   @Post(path: "values/number")
//   Future<Response<NumberValue>> createNumberValue(@Body() CreateNumberValueRequest request);

//   @Get(path: "values/number/{buildingTaskId}")
//   Future<Response<List<NumberValue>>> getNumberValues(@Path() String buildingTaskId);

//   @Get(path: "values/number/{buildingTaskId}/{numberCriteriaId}")
//   Future<Response<NumberCriteria>> deleteNumberValueByTask(@Path() String buildingTaskId, @Path() String numberCriteriaId);

//   @Delete(path: "values/number/{id}")
//   Future<Response<StatusResponse>> deleteNumberValueById(@Path() String id);
// }
