import '../../../model/response/appointments_response_model/appointments_response_model.dart';

abstract class AppointmentsDataSource {
  Future<AppointmentsResponseModel> getAppointments({
    required String id,
   required String  startDate,

  });
}
