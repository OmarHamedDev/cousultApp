import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/images/app_images.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBarWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading:   Padding(
        padding:  EdgeInsets.only(right: 12.0.w),
        child: Image.asset(AppImages.logo, width: 42.w, height: 24.h),
      ),
      title: Text(text,
        style: context.textTheme.headlineLarge,

      ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios_sharp,
            size: 20.sp,
            color: Theme.of(context).dividerColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

    ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
