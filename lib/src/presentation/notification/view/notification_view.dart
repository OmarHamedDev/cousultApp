import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/handle_bloc_builder_notification_state.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        title: Text("الإشعارات"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20.sp,
                color: Theme.of(context).dividerColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      body: HandleBlocBuilderNotificationState()
    );
  }
}
