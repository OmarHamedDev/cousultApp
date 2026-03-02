import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/service/handle_form_data/handle_form_data.dart';
import '../../../domain/entities/notification_entity.dart';
import '../../../domain/use_case/notification_use_case/get_all_notification_use_case.dart';

part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  GetAllNotificationUseCase getAllNotificationUseCase;
  NotificationCubit(this.getAllNotificationUseCase)
    : super(NotificationInitial());

  List<NotificationEntity> notificationList = [];
  Future<void> getAllNotification() async {
    emit(GetAllNotificationLoading());
    final result = await getAllNotificationUseCase.call();
    switch (result) {
      case Success<List<NotificationEntity>>():
        notificationList = result.date;
        print(notificationList[0].data);
        print( HandleFormData.formatNotificationDate(
          notificationList[0].data ??
              "2026-02-21T11:46:28.919Z"
        ));
        emit(GetAllNotificationSuccess());
        break;
      case Failures<List<NotificationEntity>>():
        emit(GetAllNotificationError(result.exception));
        break;
    }
  }
}
