import 'package:consult_app/src/presentation/bookings_user/view_model/bookings_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constance/constance.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart'
    show horizontalSpace;
import 'booking_user_item_tabs_widget.dart';

class BookingUserTabWidget extends StatelessWidget {
  const BookingUserTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingsUserCubit = context.read<BookingsUserCubit>();
    return BlocBuilder<BookingsUserCubit, BookingsUserState>(
      builder: (context, state) {
        return SizedBox(
          height: 45.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: () async =>
                   await bookingsUserCubit.changeSelectedCategoryIndex(index),
                  child: BookingUserItemTabsWidget(
                    isSelected: index == bookingsUserCubit.selectedCategoryIndex ? true : false,
                    title: AppConstance.bookingStatusMap.values.elementAt(
                        index),
                  ),
                ),
            itemCount: AppConstance.bookingStatusMap.length,
            separatorBuilder: (context, index) => horizontalSpace(10),
          ),
        );
      },
    );
  }
}
