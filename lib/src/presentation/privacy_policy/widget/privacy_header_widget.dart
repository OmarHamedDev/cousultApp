import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';

class PrivacyHeader extends StatelessWidget {
  const PrivacyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: Icon(Icons.shield_outlined, size: 80.r, color: AppColors.mainColor),
        ),
        verticalSpace(15),
        Center(
          child: Text(
            "خصوصيتك أمانة نعتز بها",
            style: theme.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        verticalSpace(10),
        Text(
          "في استشير، نلتزم بحماية بياناتك الشخصية وضمان سرية جلساتك واستشاراتك وفقاً لأعلى المعايير التقنية.",
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.dividerColor),
        ),
      ],
    );
  }
}
