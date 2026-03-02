import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/response/notifications_response_model/notifications_response_model.dart';
import 'package:injectable/injectable.dart';

import 'notification_remote_data_source.dart';

@Injectable(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final ApiManger apiManger;
  NotificationRemoteDataSourceImpl(this.apiManger);
  @override
  Future<NotificationsResponseModel> getAllNotification() async {
    return await apiManger.getAllNotifications();
  }
}
