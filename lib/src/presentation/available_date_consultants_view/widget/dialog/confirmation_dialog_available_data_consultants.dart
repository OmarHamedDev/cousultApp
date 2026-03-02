
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/app_colors.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String dayName,
  required String time,
  required String price,
  required String id,
  required String sessionDuration,
  required  Function() onTap,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w), // عشان ميبقاش لازق في الحواف
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_outline, color: AppColors.mainColor, size: 40),
            ),
            SizedBox(height: 15.h),
            Text(
              "تأكيد تفاصيل الحجز",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "راجِع بيانات الموعد قبل عملية التأكيد",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),

            // خلفية خفيفة لبيانات الموعد
            Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.03),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  _buildDialogRow(Icons.calendar_today_rounded, "اليوم", dayName),
                  SizedBox(height: 12.h),
                  _buildDialogRow(Icons.access_time_filled_rounded, "الوقت", time),
                  SizedBox(height: 12.h),
                  _buildDialogRow(Icons.timer_outlined, "مدة الجلسة", sessionDuration),

                ],
              ),
            ),

            SizedBox(height: 20.h),

            // كارت السعر
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "إجمالي التكلفة",
                    style: TextStyle(fontSize: 13.sp, color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "$price ج.م",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // الـ Row هنا ضروري عشان الـ Expanded يشتغل صح
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text("إلغاء", style: TextStyle(color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    backgroundColor: AppColors.mainColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    onTap.call();
                  },
                  child: Text("تأكيد الحجز", style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

Widget _buildDialogRow(IconData icon, String label, String value) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 16.sp, color: AppColors.mainColor),
      ),
      SizedBox(width: 10.w),
      Text(label, style: TextStyle(fontSize: 13.sp, color: Colors.grey[600])),
      const Spacer(),
      Text(value, style: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
    ],

  );
}