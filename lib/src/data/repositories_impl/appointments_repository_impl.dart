import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/appointments_data_source/appointments_data_source.dart';
import 'package:consult_app/src/domain/entities/appointments_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/appointments_repository.dart';

@Injectable(as: AppointmentsRepository)
class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final AppointmentsDataSource appointmentsDataSource;
  AppointmentsRepositoryImpl(this.appointmentsDataSource);
  @override
  Future<Result<List<AppointmentsEntity>>>
  getAppointmentsById({required
  String id,
    required String  startDate,

  }) async {
    return executeApi(
      apiCall: () async {
        var appointmentResponseModel = await
        appointmentsDataSource.getAppointments(id: id,startDate: startDate);
        List<AppointmentsEntity> appointmentsEntity =
        appointmentResponseModel
            .data!
            .map(
              (e) => AppointmentsEntity(
                id: e.id ?? "",
                dayOfWeek: e.dayOfWeek ?? "",
                startTime: e.startTime ?? 0,
                createdAt: e.createdAt ?? "",
                consultantId: e.consultantId ?? "",
                consultantName: e.consultant?.name ?? "",
                endTime: e.endTime ?? 0,
                isBooked: e.isBooked ?? false,
                consultantSessionDuration: e.consultant?.sessionDuration ?? 0,
                consultantAvatar: e.consultant?.avatar ?? "",
                sessionDuration: e.consultant?.sessionDuration.toString() ?? "",
              ),
            )
            .toList();
        return appointmentsEntity;
      },
    );
  }
}
