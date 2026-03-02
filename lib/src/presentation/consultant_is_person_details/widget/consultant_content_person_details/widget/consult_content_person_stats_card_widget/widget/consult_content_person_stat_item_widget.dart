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
    final theme = Theme.of(context);

    return Column(
      children: [
        // الأيقونة بلون الهوية الأساسي (ثابت في الوضعين)
        Icon(icon, color: AppColors.mainColor, size: 26.sp),
        verticalSpace(6),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            // التعديل: استخدام لون العناوين من الثيم
            // ده هيكون kBlack في اللايت و kWeight في الدارك بناءً على ملفاتك
            color: theme.textTheme.displayLarge?.color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            // التعديل: استخدام لون الـ bodyMedium الثابت عندك (0xFF919191)
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
      ],
    );
  }
}