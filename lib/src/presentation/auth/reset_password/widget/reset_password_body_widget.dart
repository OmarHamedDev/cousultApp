import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/colors/app_colors.dart' show AppColors;
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import '../../widgets/navigate_to_login_widget.dart';
import 'custom_reset_password_form_field_widget.dart';
class ResetPasswordBodyWidget extends StatelessWidget {
  const ResetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HandleBackGroundAuthWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تعيين كلمة مرور جديدة", style: context.textTheme.labelLarge),
          verticalSpace(10),
          Text(
            "أدخل كلمة المرور الجديدة الخاصة بك وتأكد من حفظها جيداً.",
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          verticalSpace(20),
          CustomResetPasswordFormFieldWidget(),
          verticalSpace(20),
          CustomAuthButtonWidget(
            text: "حفظ كلمة المرور",
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   // ابدأ أكشن تغيير الباسورد هنا
              // }
            },
            color: AppColors.kBlack,
          ),
          NavigateToLoginWidget(),
        ],
      ),
    );
  }
}
