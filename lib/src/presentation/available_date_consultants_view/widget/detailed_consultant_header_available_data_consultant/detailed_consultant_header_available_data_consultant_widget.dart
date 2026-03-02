import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:consult_app/core/utils/widget/cached_net_work_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/localization/locale/app_locale.dart';
import '../../../../../core/constance/constance.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/widget/custom_button_widget.dart';
import '../../view_model/available_date_consultants_cubit.dart';

class DetailedConsultantHeaderAvailableDataConsultantWidget
    extends StatelessWidget {
  const DetailedConsultantHeaderAvailableDataConsultantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var availableDateCubit = context.read<AvailableDateConsultantsCubit>();
    return Container(
      padding: EdgeInsets.only(top: 15.h, right: 10.h, left: 20.h, bottom: 20),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3.r),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  radius: 38.r,
                  child: CachedNetworkImageWidget(
                    height: 69.h,
                    width: 69.w,
                    imageUrl:
                        "${AppConstance.urlImage}${availableDateCubit.consultantsEntity?.avatar}",
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          availableDateCubit.consultantsEntity?.name ?? "",
                          style: context.textTheme.displayLarge!.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        horizontalSpace(4),
                        Icon(Icons.verified, color: Colors.blue, size: 16.r),

                        // Container(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 8.w,
                        //     vertical: 4.h,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.kYellow.withOpacity(0.1),
                        //     borderRadius: BorderRadius.circular(8.r),
                        //   ),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Icon(
                        //         Icons.star_rounded,
                        //         color: AppColors.kYellow,
                        //         size: 16.sp,
                        //       ),
                        //       SizedBox(width: 4.w),
                        //       Text(
                        //         "4.5",
                        //         style: TextStyle(
                        //           fontSize: 12.sp,
                        //           fontWeight: FontWeight.bold,
                        //           color: context.theme.canvasColor,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    verticalSpace(5),
                    Text(
                      availableDateCubit.consultantsEntity?.title ?? "",
                      style: context.textTheme.displayMedium,
                    ),
                    verticalSpace(6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${AppLocale.priceSection.getString(context)}:",
                          style: context.textTheme.displaySmall?.copyWith(
                            fontSize: 14.sp,
                            color: context.theme.canvasColor,
                          ),
                        ),
                        Text(
                          "${availableDateCubit.consultantsEntity?.sessionPrice} ج.م",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w900,
                            color: context.theme.dividerColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(6),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 12.sp,
                          color: context.theme.canvasColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          AppLocale.timeSection.getString(context),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: context.theme.canvasColor,
                            fontFamily: 'Rubik',
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          " ${availableDateCubit.consultantsEntity?.sessionDuration} دقيقة",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kBlack,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       "${AppLocale.timeSection.getString(context)}:",
                    //       style: context.textTheme.displaySmall?.copyWith(
                    //         fontSize: 14.sp,
                    //         color: context.theme.canvasColor,
                    //       ),
                    //     ),
                    //     Text(
                    //       availableDateCubit.consultantsEntity?.sessionDuration.toString() ?? "",
                    //       style: TextStyle(
                    //         fontSize: 14.sp,
                    //         fontWeight: FontWeight.w900,
                    //         color: context.theme.dividerColor,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //
                    //     // Container(
                    //     //   padding: EdgeInsets.symmetric(
                    //     //     horizontal: 8.w,
                    //     //     vertical: 4.h,
                    //     //   ),
                    //     //   color: AppColors.kYellow.withOpacity(0.1),
                    //     //   child: Row(
                    //     //     children: [
                    //     //       // Icon(icon, size: 14.r, color: color),
                    //     //       SizedBox(width: 4.w),
                    //     //       Text(
                    //     //         "200",
                    //     //         style: TextStyle(
                    //     //           fontSize: 13.sp,
                    //     //           fontWeight: FontWeight.w800,
                    //     //           color: context.theme.disabledColor,
                    //     //         ),
                    //     //       ),
                    //     //       // style: TextStyle(
                    //     //       //     fontSize: 11.sp,
                    //     //       //     fontWeight: FontWeight.bold,
                    //     //       //     color: isDark ? color.withOpacity(0.9) : color // تفتيح اللون شوية في الدارك
                    //     //       // )),
                    //     //     ],
                    //     //   ),
                    //     // ),
                    //     SizedBox(width: 8.w),
                    //     Container(
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: 8.w,
                    //         vertical: 4.h,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         color: AppColors.kYellow.withOpacity(0.1),
                    //         borderRadius: BorderRadius.circular(8.r),
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Icon(
                    //             Icons.star_rounded,
                    //             color: AppColors.kYellow,
                    //             size: 16.sp,
                    //           ),
                    //           SizedBox(width: 4.w),
                    //           Text(
                    //             "4.5",
                    //             style: TextStyle(
                    //               fontSize: 12.sp,
                    //               fontWeight: FontWeight.bold,
                    //               color: context.theme.canvasColor,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //
                    //     // _buildInfoBadge(Icons.star_rounded, "4.8", Colors.orange,
                    //     //     false),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          CustomButtonWidget(text: "الملف الشخصى "),
        ],
      ),
    );
  }
}
