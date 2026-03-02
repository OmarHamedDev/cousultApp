import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<Result<List<NotificationEntity>>>getAllNotification();

}