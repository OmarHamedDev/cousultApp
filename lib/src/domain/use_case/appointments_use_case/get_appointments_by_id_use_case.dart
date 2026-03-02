import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/appointments_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repository/appointments_repository.dart';

@injectable
class GetAppointmentsByIdUseCase {
  final AppointmentsRepository appointmentsRepository;
  GetAppointmentsByIdUseCase(this.appointmentsRepository);
    Future<Result<List<AppointmentsEntity>>>getAppointments({
      required String  startDate,
      required String id})async{
      return appointmentsRepository.getAppointmentsById(id: id,
      startDate: startDate
      );
    }

}