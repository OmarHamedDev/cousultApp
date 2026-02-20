import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../core/utils/widget/custom_tab_bar_widget.dart';
import 'booking_user_list_widget/booking_user_list_widget.dart';
import 'booking_user_tabs_widget/booking_user_tabs_widget.dart';

class BookingUserBodyWidget extends StatelessWidget {
  const BookingUserBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: symmetricPaddingSpace(h: 16, v: 16),
        child: Column(
          children: [
            CustomTabBarWidget(title: "حجوزاتي",
              isBackButton: true,
              button: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.mainColor,
                  size: 20.sp,
                ),
              ),
            ),
            verticalSpace(20),
            BookingUserTabWidget(),
            verticalSpace(20),
            BookingUserListWidget(),
          ],
        ),
      ),
    );
  }
}
