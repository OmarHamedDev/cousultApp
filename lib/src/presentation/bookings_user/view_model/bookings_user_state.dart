part of 'bookings_user_cubit.dart';

@immutable
sealed class BookingsUserState {}

final class BookingsUserInitial extends BookingsUserState {}
class ChangeSelectedCategoryIndexState extends BookingsUserState {}
class GetAllBookingUserLoadingState extends BookingsUserState {}
class GetAllBookingUserSuccessState extends BookingsUserState{}
class GetAllBookingUserFailuresState extends BookingsUserState{
  final String message;
  GetAllBookingUserFailuresState(this.message);

}