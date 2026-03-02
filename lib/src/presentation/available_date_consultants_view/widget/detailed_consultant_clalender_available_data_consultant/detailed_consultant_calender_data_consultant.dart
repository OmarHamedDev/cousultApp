import 'package:consult_app/core/utils/functions/handle_state/handle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../view_model/available_date_consultants_cubit.dart';
import 'detailed_consultant_enhanced_day_column_available_data_consultant.dart';

class DetailedConsultantCalenderDataConsultant extends StatelessWidget {
  const DetailedConsultantCalenderDataConsultant({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      AvailableDateConsultantsCubit,
      AvailableDateConsultantsState
    >(
      builder: (context, state) {
        var cubit = context.read<AvailableDateConsultantsCubit>();
        var allAppointments = cubit.appointmentsList;
        DateTime startDate = cubit.currentStartDate;

        if (state is GetAppointmentsByIdLoadingState) {
          return HandleState.loading();
        } else if (state is GetAppointmentsByIdErrorState) {
          return HandleState.error(message: state.message);
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: 7,
          itemBuilder: (context, index) {
            DateTime currentDay = startDate.add(Duration(days: index));
            String currentDayNameEn = DateFormat(
              'EEEE',
              'en',
            ).format(currentDay).toUpperCase();
            var dayAppointments = allAppointments.where((app) {
              return app.dayOfWeek.toString().toUpperCase() == currentDayNameEn;
            }).toList();
            dayAppointments.sort((a, b) => a.startTime.compareTo(b.startTime));
            return DetailedConsultantEnhancedDayColumnAvailableDataConsultant(
              fullDate: currentDay,
              appointments: dayAppointments,
            );
          },
        );
      },
    );
  }
}
