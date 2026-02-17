import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/colors/app_colors.dart';
import '../../styles/images/app_images.dart' show AppImages;

class CustomTabBarWidget extends StatelessWidget {
  final bool isBackButton;
  final String title;
  final Widget? button;

  const CustomTabBarWidget({super.key,this.button, this.isBackButton = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppImages.logo, width: 42.w, height: 24.h),
        Text(
          title,
          style: context.textTheme.headlineLarge,
        ),
        Row(
          children: [
            Icon(
              Icons.notifications_outlined,
              color: AppColors.mainColor,
              size: 25.sp,
            ),
            horizontalSpace(2),
            Icon(
              Icons.headphones_outlined,
              color: AppColors.mainColor,
              size: 25.sp,
            ),
            horizontalSpace(2),
            if(isBackButton) button!,
          ],
        ),

      ],
    );
  }
}
