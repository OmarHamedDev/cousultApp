import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/appointments_entity.dart';
import '../../view_model/available_date_consultants_cubit.dart';
import 'detailed_consultant_time_available_data_consultant.dart';

class DetailedConsultantEnhancedDayColumnAvailableDataConsultant extends StatelessWidget {
  final DateTime fullDate;
  final List<AppointmentsEntity> appointments;

  const DetailedConsultantEnhancedDayColumnAvailableDataConsultant({
    super.key,
    required this.fullDate,
    required this.appointments,
  });

  @override
  Widget build(BuildContext context) {
    var availableDateCubit = context.read<AvailableDateConsultantsCubit>();

    return InkWell(

      child: Container(
        width: 145.w,
        margin: EdgeInsets.only(left: 15.w, bottom: 20.h),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: const Color(0xFFF0F0F0), width: 1),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.03),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
              ),
              child: Column(
                children: [
                  Text(DateFormat('EEEE', 'ar').format(fullDate), style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.sp)),
                  SizedBox(height: 2.h),
                  Text(DateFormat('d MMMM', 'ar').format(fullDate), style: TextStyle(color: AppColors.mainColor, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: appointments.isEmpty
                  ? Center(child: Text("لا توجد مواعيد متاحة", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12.sp)))
                  : ListView.builder(
                padding: EdgeInsets.all(12.r),
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  AppointmentsEntity slot = appointments[index];
                  return DetailedConsultantTimeAvailableDataConsultant(
                    id: context.read<AvailableDateConsultantsCubit>().consultantsEntity?.id ?? "",
                    fullDate: fullDate,
                    slot: slot,
                    sessionDuration: slot.sessionDuration.toString(),
                    isSelected: slot.isBooked,
                    day: DateFormat('yyyy-MM-dd').format(fullDate),
                    price:"123",
                    time: availableDateCubit.formatMinutesToTime(slot.startTime),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}