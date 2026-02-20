import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart' show symmetricPaddingSpace, horizontalSpace;

class BookingUserItemTabsWidget extends StatelessWidget {
  final String title;
  final isSelected;

  const BookingUserItemTabsWidget({super.key,
    required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: symmetricPaddingSpace(h: 12, v: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.kGreen : const Color(0xFFFEFEFE),
        // color: const Color(0xFFFEFEFE),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.5.w, color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreen.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.access_time_rounded, color:
          isSelected ? AppColors.kWeight :
          AppColors.kGreen, size: 20.sp),
          horizontalSpace(8),
          Text(title, style: context.textTheme.bodySmall?.copyWith(
            color: isSelected ? AppColors.kWeight : Color(0xFF070D05),
          )),
        ],
      ),
    );
  }
}
