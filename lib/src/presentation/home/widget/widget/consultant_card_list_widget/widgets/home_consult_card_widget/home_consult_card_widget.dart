import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../config/routes/page_route_name.dart';
import '../../../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../../../domain/entities/consultants_entity.dart';
import '../../../../../../widgets/consult_card_core_widget/consult_duration_info_card_widget.dart';
import '../../../../../../widgets/consult_card_core_widget/consultant_booking_section_card_widget.dart';
import '../../../../../../widgets/consult_card_core_widget/consultant_doctor_avatar_card_widget.dart';
import '../../../../../../widgets/consult_card_core_widget/consultant_info_section_card_widget.dart';

class HomeConsultCardWidget extends StatelessWidget {
  final ConsultantsEntity consultantsEntity;
  const HomeConsultCardWidget({super.key, required this.consultantsEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          PageRouteName.consultantIsDetailsView,
          extra: consultantsEntity.publicId ?? "",
        );
      },
      child: Container(
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConsultantDoctorAvatarCardWidget(
                  avatarUrl: consultantsEntity.avatar,
                  isOnline: true,
                ),
                horizontalSpace(12),
                ConsultantInfoSectionCardWidget(
                  title: consultantsEntity.title,
                  name: consultantsEntity.name,
                  rating: consultantsEntity.rating,
                ),
                Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey[400],
                  size: 22.sp,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(color: Colors.grey[100], thickness: 1),
            ),
            ConsultantBookingSectionCardWidget(
              price: 100.toString(),
              //consultantsEntity.price.toString(),
              onBookTap: () {},
            ),
            verticalSpace(8),
            ConsultDurationInfoCardWidget(
              duration: consultantsEntity.sessionDuration.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
