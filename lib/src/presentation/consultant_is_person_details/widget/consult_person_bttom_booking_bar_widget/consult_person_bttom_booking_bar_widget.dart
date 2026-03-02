import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart' show horizontalSpace;

class ConsultPersonBottomBookingBarWidget extends StatelessWidget {
  final num price;
  const ConsultPersonBottomBookingBarWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 35.h),
        decoration: BoxDecoration(
          // التعديل هنا: استخدام surface من الـ colorScheme
          // في اللايت هيديك kWeight وفي الدارك هيديك darkSurface اللي إنت معرفه
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              // في الدارك مود بنخلي الظل أسود جداً وبشفافية أعلى عشان يحدد الكارت
              color: Colors.black.withOpacity(isDark ? 0.4 : 0.06),
              blurRadius: 20,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تكلفة الجلسة",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    // اللون الرمادي (0xFF919191) اللي إنت حاطه في الثيم
                  ),
                ),
                Text(
                  "$price ج.م",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
            horizontalSpace(20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  elevation: 0,
                ),
                child: Text(
                  "احجز الآن",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}