part of 'bookings_user_cubit.dart';

@immutable
sealed class BookingsUserState {}

final class BookingsUserInitial extends BookingsUserState {}
class ChangeSelectedCategoryIndexState extends BookingsUserState {}