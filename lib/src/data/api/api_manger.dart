import 'package:consult_app/core/api/constants/end_points.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/api/constants/api_constants.dart';
import '../model/request/register_request/Register_request.dart';
import '../model/response/consultants_person_response_model/consultants_person_response_model.dart';
import '../model/response/consultants_response_model/consultants_response_model.dart';
part 'api_manger.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(Dio dio) = _ApiManger;

  @GET(EndPoints.consultants)
  Future<ConsultantsResponseModel> getAllConsultants({
    @Query("search") String? search,
    @Query("services") String? services,
    @Query("sortBy") String? sortBy,
    @Query("order") String? order,
  });
  @GET("${EndPoints.consultants}/{id}")
  Future<ConsultantsPersonResponseModel> getConsultantsPersonById({
    @Path("id") required String id,
  });
  @POST(EndPoints.registerWithEmailAndPassword)
  Future<String> registerWithEmailAndPasswordAccount(
      @Body() Map<String,dynamic>registerRequest,
       );

}
