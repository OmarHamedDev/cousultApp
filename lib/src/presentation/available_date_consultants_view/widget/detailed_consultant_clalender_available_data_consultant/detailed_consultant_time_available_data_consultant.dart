import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/appointments_entity.dart';
import '../../view_model/available_date_consultants_cubit.dart';
import '../dialog/confirmation_dialog_available_data_consultants.dart';

class DetailedConsultantTimeAvailableDataConsultant extends StatelessWidget {
  final bool isSelected;
  final String time;
  final String day;
  final String price;
  final String id;
  final String sessionDuration;
  final  AppointmentsEntity slot;
final DateTime? fullDate;
  const DetailedConsultantTimeAvailableDataConsultant({
    super.key,
    required this.day,
    required this.fullDate,
    required this.price,
    required this.isSelected,
    required this.time,
    required this.id,
    required this.sessionDuration,
    required this.slot,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isSelected) {
          final String requestDate = DateFormat('yyyy-MM-dd').format(fullDate!);
          final String dayKey = DateFormat('EEEE', 'en').format(fullDate!).toUpperCase();
          await showConfirmationDialog(
            context: context,
            time: time,
            price: price,
            dayName: DateFormat('EEEE', 'ar').format(fullDate!), // خلي الديايلوج ياخد الاسم العربي من التاريخ علطول
            id: id,
            sessionDuration: sessionDuration,
            onTap: () async {
              await context.read<AvailableDateConsultantsCubit>().paymentConsultants(
                dayOfWeek: dayKey,
                startTime: slot.startTime,
                consultantId: id,
                date: requestDate,
              );
            },
          );
        }
      },      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.mainColor
              : AppColors.mainColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? AppColors.mainColor
                : AppColors.mainColor.withOpacity(0.1),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Icon(Icons.check_circle, color: Colors.white, size: 16.sp),
            if (isSelected) SizedBox(width: 8.w),
            Text(
              time,
              style: TextStyle(
                fontSize: 13.sp,
                color: isSelected ? Colors.white : AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
