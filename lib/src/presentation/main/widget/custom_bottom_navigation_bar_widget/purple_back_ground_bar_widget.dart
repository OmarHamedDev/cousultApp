import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurpleBackgroundBar extends StatelessWidget {
  const PurpleBackgroundBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.h,
      left: 0,
      right: 0,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          border: context.isDarkMode
              ? null
              : Border(
                  top: BorderSide(color: AppColors.mainColor, width: 1.w),
                ),
          color: context.isDarkMode ? AppColors.mainColor : AppColors.kDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
      ),
    );
  }
}
