import 'package:consult_app/config/localization/locale/app_locale.dart';
import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/auth/register/view_model/register_cubit.dart';
import 'package:consult_app/src/presentation/auth/register/widget/handle_bloc_listener_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/custom_auth_google_button_widget.dart';
import '../../widgets/custom_label_divider_widget.dart';
import '../../widgets/custom_prom_auth_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import 'custom_register_form_field_widget.dart';

class RegisterBodyWidget extends StatelessWidget {
  const RegisterBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var registerCubit = context.read<RegisterCubit>();
    return HandleBackGroundAuthWidget(
      child: Column(
        children: [
          Text(AppLocale.signUp.getString(context), style: context.textTheme.labelLarge),
          verticalSpace(20),
          CustomRegisterFormFieldWidget(),
          verticalSpace(20),
          CustomAuthButtonWidget(
            text: AppLocale.register.getString(context),
            onPressed: () {
              if(registerCubit.formKey.currentState!.validate()) {
                context
                    .read<RegisterCubit>()
                    .registerWithEmailAndPasswordAccount();
              }
              },
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
            text: AppLocale.alreadyHaveAnAccount.getString(context),
            textButton: AppLocale.login.getString(context),
            onPressed: () {
              context.go(PageRouteName.loginScreen);            },
          ),
        ],
      ),
    );
  }
}
