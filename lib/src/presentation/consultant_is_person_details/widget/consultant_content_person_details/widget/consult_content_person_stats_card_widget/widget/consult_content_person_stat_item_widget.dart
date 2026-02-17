import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../../core/utils/functions/spaceing/spaceing.dart';

class ConsultContentPersonStatItemWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const ConsultContentPersonStatItemWidget({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.mainColor, size: 26.sp),
        verticalSpace(6),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.kBlack,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[400]),
        ),
      ],
    );
  }
}
