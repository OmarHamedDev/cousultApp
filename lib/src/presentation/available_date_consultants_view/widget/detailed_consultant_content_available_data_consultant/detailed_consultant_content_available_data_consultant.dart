import 'package:consult_app/src/presentation/available_date_consultants_view/view_model/available_date_consultants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/styles/colors/app_colors.dart';
class DetailedConsultantDateNavigator extends StatelessWidget {
  const DetailedConsultantDateNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableDateConsultantsCubit, AvailableDateConsultantsState>(
      builder: (context, state) {
        var cubit = context.read<AvailableDateConsultantsCubit>();

        // 1. تثبيت تاريخ البداية من الكيوبيت
        DateTime startDate = cubit.currentStartDate;
        DateTime endDate = startDate.add(const Duration(days: 6));

        // 2. تصفير تاريخ "النهاردة" عشان المقارنة تبقى دقيقة باليوم مش بالثانية
        DateTime now = DateTime.now();
        DateTime today = DateTime(now.year, now.month, now.day);
        DateTime currentStartOnlyDate = DateTime(startDate.year, startDate.month, startDate.day);

        // 3. مقارنة دقيقة: لو تاريخ البداية الحالي هو نفسه النهاردة أو قبله، اقفل الزرار
        bool isInitialWeek = currentStartOnlyDate.isBefore(today) || currentStartOnlyDate.isAtSameMomentAs(today);

        String formattedRange = "${DateFormat('d MMMM', 'ar').format(startDate)} - ${DateFormat('d MMMM', 'ar').format(endDate)}";

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // زرار الرجوع (بيطرح 7 أيام بالظبط)
              IconButton(
                onPressed: isInitialWeek ? null : () {
                  DateTime newDate = startDate.subtract(const Duration(days: 7));
                  // لو الحسبة رجعته قبل النهاردة، خليه يقف عند النهاردة بالظبط
                  if (newDate.isBefore(today)) newDate = today;

                  cubit.getAppointments(
                    id: "9c49e8e7-4869-4b2a-b5f4-78ffae6eb083",
                    startDate: DateFormat('yyyy-MM-dd').format(newDate),
                  );
                },
                icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18.sp,
                    color: isInitialWeek ? Colors.grey.shade400 : AppColors.mainColor
                ),
              ),

              Column(
                children: [
                  Text("المواعيد المتاحة", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  Text(formattedRange, style: TextStyle(fontSize: 12.sp, color: AppColors.mainColor)),
                ],
              ),

              // زرار التقدم (بيزود 7 أيام بالظبط)
              IconButton(
                onPressed: () {
                  DateTime newDate = startDate.add(const Duration(days: 7));
                  cubit.getAppointments(
                    id: "9c49e8e7-4869-4b2a-b5f4-78ffae6eb083",
                    startDate: DateFormat('yyyy-MM-dd').format(newDate),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios, size: 18.sp, color: AppColors.mainColor),
              ),
            ],
          ),
        );
      },
    );
  }
}