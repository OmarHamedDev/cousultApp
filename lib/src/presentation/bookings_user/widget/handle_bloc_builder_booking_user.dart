import 'package:consult_app/src/presentation/bookings_user/view_model/bookings_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/functions/handle_state/handle_state.dart';
import 'booking_user_list_widget/booking_user_list_widget.dart';

class HandleBlocBuilderBookingUser extends StatelessWidget {
  const HandleBlocBuilderBookingUser({super.key});

  @override
  Widget build(BuildContext context) {
    var bookingsUserCubit = context.read<BookingsUserCubit>();
    return BlocBuilder<BookingsUserCubit, BookingsUserState>(
      builder: (context, state) {
        if (state is GetAllBookingUserLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5.h,
            child: HandleState.loading(),
          );
        } else if (state is GetAllBookingUserFailuresState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5.h,
            child: HandleState.error(message: state.message),
          );
        } else {
          return HandleState.emptyList(
            contextApp: context,
            height: 0.5,
            message: "لا توجد نتائج مطابقة لما تريد",
            list: bookingsUserCubit.bookings,
            child: BookingUserListWidget(),
          );
        }
      },
    );
  }
}
