import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart' show AppColors;

class AboutUsHeader extends StatelessWidget {
  const AboutUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Text(
            "تعرف أكثر عن استشير ....",
            style: theme.textTheme.headlineLarge?.copyWith(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "منصة إستشارات عربية رقمية",
            style: theme.textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
