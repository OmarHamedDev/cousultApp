import 'package:consult_app/core/styles/colors/app_colors.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widget/cached_net_work_image_widget.dart';

class CustomEditProfileImageWidget extends StatelessWidget {
  const CustomEditProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfileCubit=context.read<EditProfileCubit>();
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.indigo.withOpacity(0.2), width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60.r),
            child:  CachedNetworkImageWidget(
              imageUrl: editProfileCubit.image,
              width: 110,
              height: 110,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // منطق اختيار صورة من المعرض
          },
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: AppColors.mainColor,
            child: Icon(Icons.edit, size: 18.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
