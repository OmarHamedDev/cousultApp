import 'package:consult_app/config/localization/locale/app_locale.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class ConsultantBookingSectionCardWidget extends StatelessWidget {
  final String price;
  final VoidCallback onBookTap;

  const ConsultantBookingSectionCardWidget({
    super.key,
    required this.price,
    required this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocale.priceSection.getString(context),
                style: context.textTheme.displaySmall,
              ),
              Text(
                "$price ج.م",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                  color: context.theme.disabledColor,
                  fontFamily: 'Rubik',
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onBookTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            AppLocale.applyNow.getString(context),
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ],
    );
  }
}