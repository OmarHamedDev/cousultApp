part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}
final class GetAllNotificationLoading extends NotificationState {}
final class GetAllNotificationSuccess extends NotificationState {}
final class GetAllNotificationError extends NotificationState{
  final String message;
  GetAllNotificationError(this.message);
}