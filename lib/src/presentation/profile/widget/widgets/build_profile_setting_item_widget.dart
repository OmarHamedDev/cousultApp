import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildProfileSettingItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;
  final bool isSwitch;
  final bool switchValue;

  const BuildProfileSettingItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this. icon,
    required this.iconColor,
    this.onTap,
    this.isSwitch = false,
    this.switchValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.black.withOpacity(0.05), width: 1), // تحديد خفيف
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 20.sp),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2D2D),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 11.sp, color: Colors.grey[500]),
        ),
        trailing: isSwitch
            ? SizedBox(
          height: 25.h,
          child: Switch.adaptive(
            value: switchValue,
            onChanged: (val) {
              // on(val);
            },
            activeColor: const Color(0xFF9B68CD),
          ),
        )
            : Icon(
          Icons.arrow_forward_ios_rounded,
          size: 12.sp,
          color: Colors.black26,
        ),
      ),
    );
  }
}
