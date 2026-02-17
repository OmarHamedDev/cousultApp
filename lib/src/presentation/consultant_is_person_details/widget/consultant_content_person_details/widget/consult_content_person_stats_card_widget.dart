import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/consultants_person_entity.dart';
import 'consult_content_person_stats_card_widget/widget/consult_content_person__vertical_divider_widget.dart';
import 'consult_content_person_stats_card_widget/widget/consult_content_person_stat_item_widget.dart';

class ConsultContentPersonStatsCardWidget extends StatelessWidget {
   final ConsultantsPersonEntity entity;
  const ConsultContentPersonStatsCardWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConsultContentPersonStatItemWidget(icon: Icons.work_outline_rounded, value: "+ ${entity.experienceYears > 0 ? entity.experienceYears : '15+'}", label: "عام خبرة"),
          ConsultContentPersonVerticalDividerWidget(),
          ConsultContentPersonStatItemWidget(icon: Icons.schedule_rounded, value: "${entity.sessionDuration} د", label: "الجلسة"),
          ConsultContentPersonVerticalDividerWidget(),
          const ConsultContentPersonStatItemWidget(icon: Icons.verified_user_outlined, value: "موثق", label: "الحالة"),
        ],
      ),
    );
  }
}
