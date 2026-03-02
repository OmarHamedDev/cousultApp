import 'package:consult_app/core/constance/constance.dart';
import 'package:consult_app/src/presentation/bookings_user/widget/booking_user_list_widget/item_booking_user_list_widget/widget/item_booking_user_data_widget.dart';
import 'package:consult_app/src/presentation/bookings_user/widget/booking_user_list_widget/item_booking_user_list_widget/widget/item_booking_user_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../domain/entities/booking_user_entity.dart';
import '../../../../widgets/consult_card_core_widget/consult_duration_info_card_widget.dart';
import '../../../../widgets/consult_card_core_widget/consultant_doctor_avatar_card_widget.dart';
import '../../../../widgets/consult_card_core_widget/consultant_info_section_card_widget.dart';
import 'widget/item_booking_user_status_chip_widget.dart';

class ItemBookingUserListWidget extends StatelessWidget {
  final BookingUserEntity bookingUserEntity;

  const ItemBookingUserListWidget({super.key, required this.bookingUserEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(color: Theme.of(context).cardColor, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConsultantDoctorAvatarCardWidget(
                avatarUrl: bookingUserEntity.consulAvatar,
                isOnline: true,
              ),
              horizontalSpace(10),
              ConsultantInfoSectionCardWidget(
                title: bookingUserEntity.consulTitle,
                name: bookingUserEntity.consulName,
                rating: 4.5,
              ),
              ItemBookingUserStatusChipWidget(
                status: AppConstance.bookingStatusMap[bookingUserEntity.status ?? ""] ?? "PENDING",
              ),
            ],
          ),
          verticalSpace(12),
          ItemBookingUserDataWidget(
            startTime: bookingUserEntity.startAt,
            endTime: bookingUserEntity.endAt,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(color: Colors.grey[100], thickness: 1),
          ),
          ItemBookingUserPriceWidget(price: bookingUserEntity.price.toString()),
          verticalSpace(8),
          ConsultDurationInfoCardWidget(
            duration: bookingUserEntity.duration.toString(),
          ),
        ],
      ),
    );
  }
}
