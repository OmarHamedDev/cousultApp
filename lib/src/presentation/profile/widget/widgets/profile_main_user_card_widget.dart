import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMainUserCardWidget extends StatelessWidget {
  const ProfileMainUserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWeight,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: symmetricPaddingSpace(h:  12,v:  8),
        leading: Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.mainColor.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.kWeight,
            backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
          ),
        ),
        title: Text(
          "رنا ناصيف",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2D2D2D),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF9B68CD).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  "Es-RE70",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF9B68CD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              horizontalSpace(8),
              Icon(Icons.verified_rounded, size: 16.sp, color: const Color(0xFF4CAF50)),
            ],
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(6.r),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.arrow_forward_ios_rounded, size: 12.sp, color: Colors.black45),
        ),
      ),
    );
  }
}
