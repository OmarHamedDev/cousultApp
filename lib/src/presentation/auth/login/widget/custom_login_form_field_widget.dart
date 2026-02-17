import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import '../view_model/login_cubit.dart';

class CustomLoginFormFieldWidget extends StatelessWidget {
  const CustomLoginFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var loginCubit = context.read<LoginCubit>();
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        children: [
          CustomAuthTextFormFieldWidget(
            controller: TextEditingController(),
            hint: "البريد الإلكتروني",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: Validations.validateEmail,
          ),
          verticalSpace(10),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return CustomAuthTextFormFieldWidget(
                controller: TextEditingController(),
                hint: "كلمة المرور",
                validator: Validations.validatePassword,
                icon: Icons.lock_outline,
                isPassword: loginCubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    loginCubit.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    loginCubit.changePasswordVisibility();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
