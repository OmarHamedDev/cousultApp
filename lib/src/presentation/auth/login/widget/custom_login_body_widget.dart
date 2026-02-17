import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/localization/locale/app_locale.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/custom_auth_google_button_widget.dart';
import '../../widgets/custom_label_divider_widget.dart';
import '../../widgets/custom_prom_auth_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import 'custom_login_form_field_widget.dart';

class CustomLoginBodyWidget extends StatelessWidget {
  const CustomLoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HandleBackGroundAuthWidget(
      child: Column(
        children: [
          Text(
            AppLocale.loginTitle.getString(context),
            style: context.textTheme.labelLarge,
          ),
          verticalSpace(8),
          Text(
            AppLocale.loginSubTitle.getString(context),
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.kWeight,
            ),
          ),
          verticalSpace(20),
          CustomLoginFormFieldWidget(),
          verticalSpace(10),
          Align(
           alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                context.go(PageRouteName.forgetPassword);
              },
              child: Text(
                AppLocale.forgotPassword.getString(context),
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.kWeight,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          verticalSpace(10),
          CustomAuthButtonWidget(
            text: AppLocale.login.getString(context),
            onPressed: () {},
            color: AppColors.kBlack,
          ),
          verticalSpace(10),
          CustomLabelDividerWidget(),
          verticalSpace(10),
          CustomAuthGoogleButtonWidget(
            text: AppLocale.continueWithGoogle.getString(context),
            onPressed: () {},
          ),
          verticalSpace(10),
          CustomPromAuthWidget(
            text: AppLocale.dontHaveAnAccount.getString(context),
            textButton: AppLocale.register.getString(context),
              onPressed: () {
                context.go(PageRouteName.registerScreen);
              },
          ),
        ],
      ),
    );
  }
}
