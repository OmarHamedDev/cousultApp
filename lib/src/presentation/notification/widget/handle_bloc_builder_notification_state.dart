import 'package:consult_app/src/presentation/notification/view_model/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/functions/handle_state/handle_state.dart';
import 'notification_list_widget.dart';

class HandleBlocBuilderNotificationState extends StatelessWidget {
  const HandleBlocBuilderNotificationState({super.key});

  @override
  Widget build(BuildContext context) {
    var notificationCubit = context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is GetAllNotificationLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5.h,
            child: HandleState.loading(),
          );
        } else if (state is GetAllNotificationError) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5.h,
            child: HandleState.error(message: state.message),
          );
        } else {
          return HandleState.emptyList(
              contextApp: context,
              height: 0.5,
              message: "لا توجد نتائج اى اشعارات حليا الان ",
              list: notificationCubit.notificationList,
              child: NotificationListWidget()
          );
        }
      },
    );
  }
}
