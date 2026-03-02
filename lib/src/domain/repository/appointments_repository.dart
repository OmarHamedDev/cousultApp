import 'package:consult_app/core/api/common/api_result.dart';

import '../entities/appointments_entity.dart';

abstract class AppointmentsRepository {
  Future<Result<List<AppointmentsEntity>>> getAppointmentsById({required String id,

    required String  startDate,
  });
}
