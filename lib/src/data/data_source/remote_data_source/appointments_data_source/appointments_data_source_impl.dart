import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/response/appointments_response_model/appointments_response_model.dart';
import 'package:injectable/injectable.dart';

import 'appointments_data_source.dart';

@Injectable(as: AppointmentsDataSource)
class AppointmentsDataSourceImpl implements AppointmentsDataSource {
  final ApiManger apiManger;
  AppointmentsDataSourceImpl(this.apiManger);
  @override
  Future<AppointmentsResponseModel> getAppointments({
    required String id,
    required String  startDate,

  }) async {
    return apiManger.getAllUserAppointments(id: id,startDate: startDate);
  }
}
