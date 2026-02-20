import 'package:consult_app/src/presentation/bookings_user/view_model/bookings_user_cubit.dart';
import 'package:consult_app/src/presentation/bookings_user/widget/booking_user_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingUserView extends StatelessWidget {
  const BookingUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingsUserCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BookingUserBodyWidget()
        ),
      ),
    );
  }
}
