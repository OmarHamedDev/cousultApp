import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/colors/app_colors.dart';

class AppLightTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.kWeightLight,
    primaryColor: AppColors.mainColor,
    cardColor: AppColors.kWeight,
    canvasColor: AppColors.kGray,
    dividerColor: AppColors.kBlack,
    disabledColor: AppColors.mainColor,
    fontFamily: "Rubik",
    textTheme: TextTheme(
       //HOME
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
      labelLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.kBlack,
    ),
      headlineMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
        decoration: TextDecoration.underline,
      ),
      headlineSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.kBlack,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color:AppColors.kWeight,
      ),
     bodyMedium:  TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xFF919191),
      ),
     bodySmall: TextStyle(
       fontSize: 14.sp,
       fontWeight: FontWeight.w500,
       color: const Color(0xFF070D05),
     ),
     displayLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.bold,
      color: AppColors.kBlack,
    ),
      displayMedium: TextStyle(
        fontSize: 12.sp,
        color: Colors.grey[600],
        height: 1.2,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.mainColor,
      ),
      labelMedium: TextStyle(
    fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color:  AppColors.kBlack,

  )
    ),

  );
}
