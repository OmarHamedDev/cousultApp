import 'package:consult_app/config/localization/locale/app_locale.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';

class ConsultDurationInfoCardWidget extends StatelessWidget {
  final String duration;

  const ConsultDurationInfoCardWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 12.sp,
          color: context.theme.canvasColor,
        ),
        SizedBox(width: 4.w),
        Text(
          AppLocale.timeSection.getString(context),
          style: TextStyle(
            fontSize: 13.sp,
            color: context.theme.canvasColor,
            fontFamily: 'Rubik',
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          " $duration دقيقة",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.kBlack,
            fontFamily: 'Rubik',
          ),
        ),
      ],
    );
  }
}
