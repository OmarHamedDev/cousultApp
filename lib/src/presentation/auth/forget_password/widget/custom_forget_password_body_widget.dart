import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/localization/locale/app_locale.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import '../../widgets/navigate_to_login_widget.dart';
import '../view_model/forget_password_cubit.dart';

class CustomForgetPasswordBodyWidget extends StatelessWidget {
  const CustomForgetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var forgetPasswordCubit=context.read<ForgetPasswordCubit>();
    return HandleBackGroundAuthWidget(
      child: Form(
       key: forgetPasswordCubit.formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.forgotPassword.getString(context),
              style: context.textTheme.labelLarge,

            ),
            verticalSpace(10),
            Text(
              "أدخل بريدك الإلكتروني لإرسال رابط استعادة كلمة المرور",
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
              ),
            ),
            verticalSpace(20),
            CustomAuthTextFormFieldWidget(
              controller: forgetPasswordCubit.emailController,
              hint: AppLocale.email.getString(context),
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: Validations.validateEmail,
            ),
            verticalSpace(14),
            CustomAuthButtonWidget(
              text: "إرسال الرابط",
              onPressed: () {
                if (forgetPasswordCubit.formKey.currentState!.validate()) {
                  forgetPasswordCubit.forgetPassword(
                    email: forgetPasswordCubit.emailController.text,
                  );
                }
              },
              color: AppColors.kBlack,
            ),
            verticalSpace(2),
            NavigateToLoginWidget(),
          ],
        ),
      ),
    );
  }
}
