import 'package:consult_app/src/presentation/main/widget/custom_bottom_navigation_bar_widget/side_icon_item_bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/main_cubit.dart';

class CustomIconsBottonNavBarWidget extends StatelessWidget {
  const CustomIconsBottonNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MainCubit>();

    return Positioned(
      bottom: 40.h,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 56.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SideIconItemBottomNavWidget(index: 0, cubit: cubit),
            SideIconItemBottomNavWidget(index: 1, cubit: cubit),
            SizedBox(width: 75.w),
            SideIconItemBottomNavWidget(index: 3, cubit: cubit),
            SideIconItemBottomNavWidget(index: 4, cubit: cubit),
          ],
        ),
      ),
    );
  }
}
