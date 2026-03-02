part of 'available_date_consultants_cubit.dart';

@immutable
sealed class AvailableDateConsultantsState {}

final class AvailableDateConsultantsInitial extends AvailableDateConsultantsState {}
class GetAppointmentsByIdLoadingState extends AvailableDateConsultantsState{}
class GetAppointmentsByIdSuccessState extends AvailableDateConsultantsState{}
class GetAppointmentsByIdErrorState extends AvailableDateConsultantsState{
  final String message;
  GetAppointmentsByIdErrorState(this.message);
}
class PaymentConsultantsLoadingState extends AvailableDateConsultantsState{}
class PaymentConsultantsSuccessState extends AvailableDateConsultantsState{}
class PaymentConsultantsErrorState extends AvailableDateConsultantsState{
  final String message;
  PaymentConsultantsErrorState(this.message);

}