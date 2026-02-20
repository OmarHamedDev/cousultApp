import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/widget/custom_tab_bar_widget.dart';
import '../../widgets/custom_auth_button_widget.dart';
import 'custom_edit_profile_form_field_widget.dart';

class CustomEditProfileBodyWidget extends StatelessWidget {
  const CustomEditProfileBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var editProfile=context.read<EditProfileCubit>();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBarWidget(
              title: "تعديل الملف الشخصي",
              isBackButton: true,
              button: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: AppColors.mainColor,
                  size: 20.sp,
                ),
              ),
            ),
            CustomEditProfileFormFieldWidget(),
            CustomAuthButtonWidget(
              text: "حفظ التعديلات",
              color: AppColors.mainColor,
              onPressed: () {
                if(editProfile.formKey.currentState!.validate()){
                 editProfile.editProfile();
                }
              },
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
