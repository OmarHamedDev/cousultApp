import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/service/handle_form_data/handle_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../domain/entities/notification_entity.dart';

class ItemNotificationWidget extends StatelessWidget {
  final NotificationEntity notificationEntity;
  const ItemNotificationWidget({super.key, required this.notificationEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.mainColor.withOpacity(0.4),
          width: 1.2.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45.h,
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_active,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notificationEntity.title ?? "Notification Title",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(6),
                Text(
                  notificationEntity.message ?? "Notification Message",

                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    height: 1.4,
                  ),
                ),
                verticalSpace(6),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.access_time, size: 12.sp, color:
                     context.theme.cardColor,
                    ),
                    horizontalSpace(4),
                    Text(
                      HandleFormData.formatNotificationDate(
                        notificationEntity.data ?? "2026-02-21T11:46:28.919Z",
                      ),
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
