import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/styles/images/app_images.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kGreen,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderText(),
          verticalSpace(4),
          _buildSubTitleText(),
          verticalSpace(10),
          _buildBookNowButton(),
          verticalSpace(10),
          _buildFooterRow(),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      "تحتاج رعاية نفسية عاجلة ؟",
      style: TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
    );
  }

  Widget _buildSubTitleText() {
    return Text(
      "جلسات فورية مع أفضل المستشارين ",
      style: TextStyle(
        fontSize: 14.sp,
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
        color: AppColors.kWeight,
      ),
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      height: 40.h,
      width: 90.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        "احجز الآن",
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          color: AppColors.kWeightLight,
        ),
      ),
    );
  }

  Widget _buildFooterRow() {
    return Row(
      children: [
        Icon(Icons.timelapse, color: AppColors.kWeightLight, size: 18.sp),
        horizontalSpace(8),
        Text(
          "مدة الانتظار 1-5 دقائق",
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
            color: AppColors.kWeightLight,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Image.asset(
              AppImages.personBanners,
              width: 50.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            horizontalSpace(4),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.kWeight,
              size: 14.sp,
            ),
          ],
        ),
      ],
    );
  }
}
