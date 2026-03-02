import 'package:consult_app/src/data/model/response/booking_user_response_model/booking_user_response_model.dart';

import '../../../model/response/consultants_person_response_model/consultants_person_response_model.dart';
import '../../../model/response/consultants_response_model/consultants_response_model.dart';

abstract class ConsultantsRemoteDataSource {
  Future<ConsultantsResponseModel>getAllConsultants({
    String? search,
    String? services,
    String? sortBy,
    String? order,
});
  Future<ConsultantsPersonResponseModel>getConsultantsPersonById({
   required String id,
  });
  Future<BookingUserResponseModel>getAllUserBookings({
    String? status,
  });


}