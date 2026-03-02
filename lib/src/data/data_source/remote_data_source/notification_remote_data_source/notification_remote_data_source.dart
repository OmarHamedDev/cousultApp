import '../../../model/response/notifications_response_model/notifications_response_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationsResponseModel>getAllNotification();
}