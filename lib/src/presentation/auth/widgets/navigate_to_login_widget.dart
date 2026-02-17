import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';

class NavigateToLoginWidget extends StatelessWidget {
  const NavigateToLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(PageRouteName.loginScreen);
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "العودة لتسجيل الدخول",
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.kWeight,
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.kWeight),
          ],
        ),
      ),
    );
  }
}
