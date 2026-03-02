import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/notification_cubit.dart';
import 'item_notification_widget.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var notificationCubit = context.read<NotificationCubit>();
    return ListView.builder(
      padding: symmetricPaddingSpace(h: 16, v: 12),
      itemCount: notificationCubit.notificationList.length,
      itemBuilder: (context, index) {
        return ItemNotificationWidget(
          notificationEntity: notificationCubit.notificationList[index],
        );
      },
    );
  }
}
