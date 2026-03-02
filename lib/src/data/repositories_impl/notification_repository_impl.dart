import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/domain/entities/notification_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/notification_repository.dart';
import '../data_source/remote_data_source/notification_remote_data_source/notification_remote_data_source.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  NotificationRepositoryImpl(this.notificationRemoteDataSource);
  @override
  Future<Result<List<NotificationEntity>>> getAllNotification() async {
    return executeApi(
      apiCall: () async {
        var notificationsResponseModel = await notificationRemoteDataSource
            .getAllNotification();
        List<NotificationEntity> notificationList = notificationsResponseModel
            .data!
            .map(
              (e) => NotificationEntity(
                id: e.id,
                message: e.message,
                title: e.title,
                type: e.type,
                data: e.createdAt,
              ),
            )
            .toList();
        return notificationList;
      },
    );
  }
}
