import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/widget/custom_tab_bar_widget.dart' show CustomTabBarWidget;

class AboutUsAppBar extends StatelessWidget {
  const AboutUsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBarWidget(
      title: "من نحن",
      isBackButton: true,
      button: InkWell(
        onTap: () => context.pop(),
        child: Icon(
          Icons.arrow_forward_ios_sharp,
          color: AppColors.mainColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
