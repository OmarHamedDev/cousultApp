import 'package:consult_app/core/extension/extension.dart'; // تأكد من وجود الـ extension للـ textTheme
import 'package:consult_app/core/utils/functions/spaceing/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import '../view_model/change_password_cubit.dart';

class CustomChangePasswordFormWidget extends StatelessWidget {
  const CustomChangePasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var changePassswordCubit = context.read<ChangePasswordCubit>();
    return Form(
      key: changePassswordCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFieldTitle(context, "كلمة المرور الحالية"),
          verticalSpace(8),
          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, state) {
              return CustomAuthTextFormFieldWidget(
                controller: changePassswordCubit.passwordController,
                hint: "أدخل كلمة المرور الحالية",
                keyboardType: TextInputType.visiblePassword,
                icon: Icons.lock_outline_rounded,
                isPassword: changePassswordCubit.isPasswordVisible,
                validator: Validations.validatePassword,
                suffixIcon: IconButton(
                  onPressed: changePassswordCubit.togglePasswordVisibility,
                  icon: Icon(
                    changePassswordCubit.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ),
              );
            },
          ),

          verticalSpace(20),
          _buildFieldTitle(context, "كلمة المرور الجديدة"),
          verticalSpace(8),
          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, state) {
              return CustomAuthTextFormFieldWidget(
                controller: changePassswordCubit.confirmPasswordController,
                hint: "أدخل كلمة المرور الجديدة",
                icon: Icons.lock_reset_rounded,
                isPassword: changePassswordCubit.isConfirmPasswordVisible,
                validator: Validations.validatePassword,
                suffixIcon: IconButton(
                  onPressed:
                      changePassswordCubit.toggleConfirmPasswordVisibility,
                  icon: Icon(
                    changePassswordCubit.isConfirmPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ),
              );
            },
          ),

          verticalSpace(20),
          _buildFieldTitle(context, "تأكيد كلمة المرور الجديدة"),
          verticalSpace(8),
          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, state) {
              return CustomAuthTextFormFieldWidget(
                controller: changePassswordCubit.currentPasswordController,
                hint: "أعد كتابة كلمة المرور",
                icon: Icons.check_circle_outline_rounded,
                isPassword: changePassswordCubit.isCurrentPasswordVisible,
                suffixIcon: IconButton(
                  onPressed:
                      changePassswordCubit.toggleCurrentPasswordVisibility,
                  icon: Icon(
                    changePassswordCubit.isCurrentPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                ),
                validator: (value) => Validations.validateConfirmPassword(
                  value,
                  changePassswordCubit.confirmPasswordController.text,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFieldTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.displayMedium?.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: context.theme.dividerColor
      )
    );
  }
}
