import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDarkTheme {
  AppDarkTheme._();

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.kDark,
    primaryColor: AppColors.mainColor,
    cardColor: AppColors.kGray,
    disabledColor: AppColors.kWeight,
    canvasColor: AppColors.kWeight,

    fontFamily: "Rubik",
    textTheme: TextTheme(
      //HOME(appBar)
        headlineLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kGray,
        ),
        //HOME(appBar)

        headlineMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kGray,
          decoration: TextDecoration.underline,
        ),
        //Home(Title)
        headlineSmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kGray,
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
      fontWeight: FontWeight.bold,
      color: AppColors.kWeight,
    ),
      displayMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.kWeight,
        height: 1.2,
      ),
      displaySmall: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kBlack,
      ),
  ),
  );
}
