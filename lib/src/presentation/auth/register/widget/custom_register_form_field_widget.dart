import 'package:consult_app/src/presentation/auth/register/view_model/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';

class CustomRegisterFormFieldWidget extends StatelessWidget {
  const CustomRegisterFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    return Form(
      key: registerCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAuthTextFormFieldWidget(
            controller: registerCubit.nameController,
            hint: "الاسم بالكامل",
            icon: Icons.person_outline,
            keyboardType: TextInputType.name,
            validator: Validations.validateName,
          ),
          verticalSpace(10),
          CustomAuthTextFormFieldWidget(
            controller: registerCubit.emailController,
            hint: "البريد الإلكتروني",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: Validations.validateEmail,
          ),
          verticalSpace(10),
          CustomAuthTextFormFieldWidget(
            controller: registerCubit.phoneController,
            hint: "رقم الهاتف",
            validator: Validations.validatePhoneNumber,
            icon: Icons.phone_android_outlined,
            keyboardType: TextInputType.phone,
            prefixText: "+20 ",
          ),
          verticalSpace(10),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return     CustomAuthTextFormFieldWidget(
                controller: registerCubit.passwordController,
                hint: "كلمة المرور",
                validator: Validations.validatePassword,
                icon: Icons.lock_outline,
                isPassword:  registerCubit.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    registerCubit.isPasswordVisible  ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black54,
                    size: 20.sp,
                  ),
                  onPressed: () {
                    registerCubit.changePasswordVisibility();
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
