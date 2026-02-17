import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';

class HandleBackGroundAuthWidget extends StatelessWidget {
  final Widget child;
  const HandleBackGroundAuthWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(bottom: keyboardHeight),
        child: Column(
          children: [
            if (keyboardHeight == 0) verticalSpace(30),
            if (keyboardHeight == 0)
              Center(
                child: Image.asset(
                  AppImages.logo,
                  width: 202.w,
                  height: 106.h,
                  fit: BoxFit.contain,
                ),
              ),
            verticalSpace(20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.95),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
