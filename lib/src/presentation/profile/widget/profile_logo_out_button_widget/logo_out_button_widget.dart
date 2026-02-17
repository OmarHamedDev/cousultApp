import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/functions/spaceing/spaceing.dart';

class LogoOutButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const LogoOutButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE), // لون أحمر باهت جداً مريح للعين
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.red.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تسجيل الخروج",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            horizontalSpace(10),
            Icon(Icons.logout_rounded, color: Colors.redAccent, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
