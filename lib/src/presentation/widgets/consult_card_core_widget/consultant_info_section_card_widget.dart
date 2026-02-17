import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class ConsultantInfoSectionCardWidget extends StatelessWidget {
  final String name;
  final String title;
  final num rating;

  const ConsultantInfoSectionCardWidget({
    super.key,
    required this.name,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "د/$name",
            style: context.textTheme.displayLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: context.textTheme.displayMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6.h),
          _ratingBadge(context),
        ],
      ),
    );
  }

  Widget _ratingBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.kYellow.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: AppColors.kYellow, size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            "$rating",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: context.theme.canvasColor,
            ),
          ),
        ],
      ),
    );
  }
}