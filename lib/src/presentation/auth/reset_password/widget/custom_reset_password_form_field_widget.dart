import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import '../view_model/reset_password_cubit.dart';

class CustomResetPasswordFormFieldWidget extends StatelessWidget {
  const CustomResetPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordCubit = context.read<ResetPasswordCubit>();
    return Form(
      key: resetPasswordCubit.formKey,
      child: Column(
        children: [
          CustomAuthTextFormFieldWidget(
            controller: resetPasswordCubit.passwordController,
            // controller: _passwordController,
            hint: "كلمة المرور الجديدة",
            icon: Icons.lock_outline,
            isPassword: false,
            validator: (value) => Validations.validatePassword(value),
            suffixIcon: IconButton(
              icon: Icon(false ? Icons.visibility_off : Icons.visibility),
              onPressed: () {},
              // onPressed: () => setState(() => isObscure = !isObscure),
            ),
          ),
          verticalSpace(16),
          CustomAuthTextFormFieldWidget(
            controller: resetPasswordCubit.confirmPasswordController,

            // controller: _confirmPasswordController,
            hint: "تأكيد كلمة المرور",
            icon: Icons.lock_reset_outlined,
            isPassword: false,
            validator: (value) => Validations.validateConfirmPassword(
              resetPasswordCubit.passwordController.text,
              value,
            ),
            suffixIcon: IconButton(
              icon: Icon(false ? Icons.visibility_off : Icons.visibility),
              onPressed: () {},
              // onPressed: () => setState(() => isConfirmObscure = !isConfirmObscure),
            ),
          ),
        ],
      ),
    );
  }
}
