import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:consult_app/core/utils/widget/cached_net_work_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/profile_cubit.dart';

class ProfileMainUserCardWidget extends StatelessWidget {
  const ProfileMainUserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var appUserEntity = context.read<ProfileCubit>().appUserEntity;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: symmetricPaddingSpace(h: 12, v: 8),
        leading: Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.mainColor.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: CachedNetworkImageWidget(
              imageUrl: (appUserEntity?.avatar?.trim() ?? "").isEmpty
                  ? "https://pub-c4ba7858977a45ae8e3be74309ee0122.r2.dev/temporary-upload/02561974.jpeg"
                  : appUserEntity!.avatar!,              width: 40.w,
              height: 40.w),
        ),
        title: Text(
          appUserEntity?.userName ?? "User",
          style: context.textTheme.displayLarge?.copyWith(fontSize: 17.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis, // لو طويل يحط ...
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    appUserEntity?.id ?? "",
                    style: context.textTheme.displayMedium?.copyWith(fontSize: 11.sp),

                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // لو الايميل طويل يحط ...
                  ),
                ),
              ),
              horizontalSpace(4),
              Icon(
                Icons.verified_rounded,
                size: 16.sp,
                color: const Color(0xFF4CAF50),
              ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14.sp,
          color: context.theme.dividerColor,
        ),
      ),
    );
  }
}