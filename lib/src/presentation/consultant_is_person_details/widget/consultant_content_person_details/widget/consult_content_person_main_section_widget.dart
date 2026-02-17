import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../domain/entities/consultants_person_entity.dart';
import 'consult_content__about_info_action_icon_button_widget.dart';
import 'consult_content_rating_badge_widget.dart';

class ConsultContentPersonMainSectionWidget extends StatelessWidget {
  final ConsultantsPersonEntity entity;
  const ConsultContentPersonMainSectionWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "د/${entity.name}",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.kBlack,
                ),
              ),
              verticalSpace(4),
              Text(
                entity.title,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(12),
              Row(
                children: [
                  ConsultContentRatingBadgeWidget(rating: entity.rating),
                  horizontalSpace(10),
                  Text(
                    "(${entity.reviews} تقييم)",
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
        ),
        ConsultContentPersonDetailsAboutInfoActionIconButtonWidget(
          icon: Icons.favorite_border,
          color: Colors.grey[400]!,
        ),
      ],
    );
  }
}
