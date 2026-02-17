import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../view_model/main_cubit.dart';
class SideIconItemBottomNavWidget extends StatelessWidget {
  final int index;
  final MainCubit cubit;

  const SideIconItemBottomNavWidget({
    super.key,
    required this.index,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    bool isCurrentlyInCenter = cubit.selectedIndex == index;
    return GestureDetector(
      onTap: () => cubit.changeBottomNavIndex(index),
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: context.isDarkMode  ? AppColors.kWeightLight : AppColors.kDark,
          shape: BoxShape.circle,
          border: context.isDarkMode  ? null :Border.all(color: AppColors.mainColor,width: 2.w) ,
        ),
        child: Center(
          child: SvgPicture.asset(
            isCurrentlyInCenter
                ? AppImages.iconsBottomNav[2]
                : AppImages.iconsBottomNav[index],
            width: 24.w,
            height: 24.h,
            colorFilter:  ColorFilter.mode(
              context.isDarkMode  ? Colors.black87 : AppColors.kWeightLight,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
