import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';

class CustomResetPasswordFormFieldWidget extends StatelessWidget {
  const CustomResetPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextFormFieldWidget(
          controller: TextEditingController(),

          // controller: _passwordController,
          hint: "كلمة المرور الجديدة",
          icon: Icons.lock_outline,
          isPassword: false,
          validator: (value) => Validations.validatePassword(value),
          suffixIcon: IconButton(
            icon: Icon(false? Icons.visibility_off : Icons.visibility),
            onPressed: () {

            },
            // onPressed: () => setState(() => isObscure = !isObscure),
          ),
        ),
        verticalSpace(16),
        CustomAuthTextFormFieldWidget(
          controller: TextEditingController(),

          // controller: _confirmPasswordController,
          hint: "تأكيد كلمة المرور",
          icon: Icons.lock_reset_outlined,
          isPassword: false,
          validator: (value) => Validations.validateConfirmPassword(
            "",
            value,
          ),
          suffixIcon: IconButton(
            icon: Icon(false ? Icons.visibility_off : Icons.visibility),
            onPressed: () {

            },
            // onPressed: () => setState(() => isConfirmObscure = !isConfirmObscure),
          ),
        ),
      ],
    );
  }
}
