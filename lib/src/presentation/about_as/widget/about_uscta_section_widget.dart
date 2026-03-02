import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Theme, ElevatedButton, Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors/app_colors.dart';

class AboutUsCTASection extends StatelessWidget {
  const AboutUsCTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.mainColor),
      ),
      child: Column(
        children: [
          Text(
            "هل تحتاج التحدث مع مختص الآن ؟",
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "تمنحك الجلسة الفورية فرصة للتواصل المباشر مع استشاري مؤهل في نفس اللحظة دون انتظار أو حجز مسبق",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              // shape: RoundedRectangleApp(borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
            ),
            onPressed: () {
              context.push(PageRouteName.mainScreen);
            },
            child: Text(
              "احجز الجلسة الآن",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
