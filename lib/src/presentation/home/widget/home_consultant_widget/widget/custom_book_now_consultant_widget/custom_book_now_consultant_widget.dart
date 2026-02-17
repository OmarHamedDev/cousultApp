import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/styles/images/app_images.dart';
import '../../../../../../../core/utils/functions/spaceing/spaceing.dart';

class CustomBookNowConsultantWidget extends StatelessWidget {
  const CustomBookNowConsultantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      padding: symmetricPaddingSpace(h: 16, v: 8),
      decoration: BoxDecoration(
        color: AppColors.kWeightLight,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1C000000),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.flash_on_rounded, color: Color(0xFF919191), size: 25.sp),
          horizontalSpace(8),
          Text("احجز جلسة فورية الآن", style: context.textTheme.bodyMedium),
          Spacer(),
          Row(
            children: [
              Image.asset(
                AppImages.personBanners,
                width: 50.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
              horizontalSpace(4),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF919191),
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
