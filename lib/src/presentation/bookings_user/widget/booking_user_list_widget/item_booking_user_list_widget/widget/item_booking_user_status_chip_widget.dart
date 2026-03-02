import 'package:consult_app/core/constance/constance.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/bookings_user/view_model/bookings_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/styles/colors/app_colors.dart';
import '../../../../../../../core/utils/functions/spaceing/spaceing.dart';

class ItemBookingUserStatusChipWidget extends StatelessWidget {
  final String status;
  const ItemBookingUserStatusChipWidget({super.key,required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetricPaddingSpace(h: 12, v: 8),
      decoration: BoxDecoration(
        color: AppColors.kGreen ,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.5.w, color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreen.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12.r,
          ),
        ],
      ),
      child: Text(
        status,
        style:
        context.textTheme.bodySmall?.copyWith(
            fontSize: 11.sp,
          color: AppColors.kWeight ,
        )),
    );
  }
}
