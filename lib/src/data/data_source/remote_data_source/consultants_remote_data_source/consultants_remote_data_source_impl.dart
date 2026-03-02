import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/response/booking_user_response_model/booking_user_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../model/response/consultants_person_response_model/consultants_person_response_model.dart';
import '../../../model/response/consultants_response_model/consultants_response_model.dart';
import 'consultants_remote_data_source.dart';

@Injectable(as: ConsultantsRemoteDataSource)
class ConsultantsRemoteDataSourceImpl implements ConsultantsRemoteDataSource {
  final ApiManger apiManger;
  ConsultantsRemoteDataSourceImpl(this.apiManger);
  @override
  Future<ConsultantsResponseModel> getAllConsultants({
    String? search,
    String? services,
    String? sortBy,
    String? order,
}) async {
    return await apiManger.getAllConsultants(
      search: search,
      services: services,
      sortBy: sortBy,
      order: order,
    );
  }

  @override
  Future<ConsultantsPersonResponseModel> getConsultantsPersonById({required String id}) {
    return apiManger.getConsultantsPersonById(id: id);
  }

  @override
  Future<BookingUserResponseModel> getAllUserBookings({String? status}) {
    return apiManger.getAllUserBookings(status: status);
  }

}
