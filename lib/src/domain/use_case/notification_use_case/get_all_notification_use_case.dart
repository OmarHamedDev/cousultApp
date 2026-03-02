import 'package:consult_app/src/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart' show Result;
import '../../entities/notification_entity.dart';

@injectable
class GetAllNotificationUseCase {
  final NotificationRepository notificationRepository;

  GetAllNotificationUseCase(this.notificationRepository);
  Future<Result<List<NotificationEntity>>> call() async {
    return await notificationRepository.getAllNotification();
  }
}
