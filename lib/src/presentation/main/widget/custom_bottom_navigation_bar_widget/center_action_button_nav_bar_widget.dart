import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../view_model/main_cubit.dart';

class CenterActionButtonNavBarWidget extends StatelessWidget {
  final MainCubit cubit;
  const CenterActionButtonNavBarWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.w,
      child: GestureDetector(
        onTap: () => cubit.changeBottomNavIndex(2),
        child: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color:context.isDarkMode  ?  AppColors.kGreen : AppColors.mainColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10.r,
                spreadRadius: 2.r,
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset(
              AppImages.iconsBottomNav[cubit.selectedIndex],
              width: 24.w,
              height: 24.h,
              colorFilter: const ColorFilter.mode(
                AppColors.kLightGray,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
