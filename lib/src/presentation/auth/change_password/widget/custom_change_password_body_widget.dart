import 'package:consult_app/src/presentation/auth/change_password/view_model/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/widget/custom_tab_bar_widget.dart';
import '../../widgets/custom_auth_button_widget.dart';
import 'custom_change_password_form_widget.dart';

class CustomChangePasswordBodyWidget extends StatelessWidget {
  const CustomChangePasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: keyboardHeight,
          left: 24.w,
          right: 24.w,
          top: 20.h,
        ),
        child: Column(
          children: [
            CustomTabBarWidget(
              button: GestureDetector(
                onTap: () {
                   context.pop();
                 },
                child: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.mainColor,size: 20.sp),),
              title: "تعديل كلمة المرور",isBackButton: true,),
            verticalSpace(20),
            CustomChangePasswordFormWidget(),
            verticalSpace(20),
            CustomAuthButtonWidget(
              text: "تعديل كلمة المرور",
              onPressed: () {
                context.read<ChangePasswordCubit>().changePassword();
              },
              color: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
