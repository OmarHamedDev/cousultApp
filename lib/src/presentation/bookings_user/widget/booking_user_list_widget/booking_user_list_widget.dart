import 'package:consult_app/src/presentation/bookings_user/view_model/bookings_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import 'item_booking_user_list_widget/item_booking_user_list_widget.dart';

class BookingUserListWidget extends StatelessWidget {
  const BookingUserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingUserCubit = context.read<BookingsUserCubit>();
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => verticalSpace(12),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => ItemBookingUserListWidget(
          bookingUserEntity: bookingUserCubit.bookings[index],
        ),
        itemCount: bookingUserCubit.bookings.length,
      ),
    );
  }
}
