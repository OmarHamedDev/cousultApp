import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/appointments_entity.dart';
import 'package:consult_app/src/domain/entities/consultants_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../data/model/request/user_booking_with_payment_request_model/User_booking_with_payment_request_model.dart';
import '../../../domain/use_case/appointments_use_case/get_appointments_by_id_use_case.dart';
import '../../../domain/use_case/payment_use_case/get_user_booking_with_payment_use_case.dart';

part 'available_date_consultants_state.dart';

@injectable
class AvailableDateConsultantsCubit
    extends Cubit<AvailableDateConsultantsState> {
  final GetAppointmentsByIdUseCase getAppointmentsByIdUseCase;
  final GetUserBookingWithPaymentUseCase getUserBookingWithPaymentUseCase;

  AvailableDateConsultantsCubit(
    this.getUserBookingWithPaymentUseCase,
    this.getAppointmentsByIdUseCase,
  ) : super(AvailableDateConsultantsInitial());

  List<AppointmentsEntity> appointmentsList = [];
  DateTime currentStartDate = DateTime.now();

  Future<void> getAppointments({
    required String id,
    required String startDate,
  }) async {
    currentStartDate = DateTime.parse(startDate);
    emit(GetAppointmentsByIdLoadingState());

    var result = await getAppointmentsByIdUseCase.getAppointments(
      id: id,
      startDate: startDate,
    );

    switch (result) {
      case Success<List<AppointmentsEntity>>():
        appointmentsList = result.date;
        emit(GetAppointmentsByIdSuccessState());
      case Failures<List<AppointmentsEntity>>():
        emit(GetAppointmentsByIdErrorState(result.exception));
    }
  }

  ConsultantsEntity? consultantsEntity;

  String formatMinutesToTime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    String period = hours >= 12 ? "م" : "ص";
    if (hours > 12) hours -= 12;
    if (hours == 0) hours = 12;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period";
  }

  String linkUrl = "";
  Future<void> paymentConsultants({
    required String consultantId,
    required String date,
    required String dayOfWeek,
    required int startTime,
  }) async {
    emit(PaymentConsultantsLoadingState());
    var result = await getUserBookingWithPaymentUseCase.call(
      userBookingWithPaymentRequestModel: UserBookingWithPaymentRequestModel(
        consultantId: consultantId,
        date: date,
        dayOfWeek: dayOfWeek,
        startTime: startTime,
      ),
    );
    switch (result) {
      case Success<String>():
        linkUrl = result.date;
        emit(PaymentConsultantsSuccessState());
      case Failures<String>():
        emit(PaymentConsultantsErrorState(result.exception));
    }
  }
}
