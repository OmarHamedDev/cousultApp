import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/localization/locale/app_locale.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../../../../core/utils/functions/validators/validations.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/custom_auth_text_form_field_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import '../../widgets/navigate_to_login_widget.dart';

class CustomForgetPasswordBodyWidget extends StatelessWidget {
  const CustomForgetPasswordBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HandleBackGroundAuthWidget(
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
            controller: TextEditingController(),
            hint: AppLocale.email.getString(context),
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: Validations.validateEmail,
          ),
          verticalSpace(14),
          CustomAuthButtonWidget(
            text: "إرسال الرابط",
            onPressed: () {
              context.go(PageRouteName.verifyOtpEmail);
            },
            color: AppColors.kBlack,
          ),
          verticalSpace(2),
          NavigateToLoginWidget(),
        ],
      ),
    );
  }
}
