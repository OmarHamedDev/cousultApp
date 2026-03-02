import 'package:consult_app/core/extension/extension.dart';
import 'package:consult_app/src/presentation/auth/verify_otp/widget/pin_code_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/utils/functions/spaceing/spaceing.dart';
import '../../widgets/custom_auth_button_widget.dart';
import '../../widgets/custom_prom_auth_widget.dart';
import '../../widgets/handle_back_ground_auth_widget.dart';
import '../../widgets/navigate_to_login_widget.dart';
import '../view_model/verify_otp_cubit.dart';

class VerifyOtpBodyWidget extends StatelessWidget {
  const VerifyOtpBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var verifyOtpCubit = context.read<VerifyOtpCubit>();
    return HandleBackGroundAuthWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تفعيل الحساب", style: context.textTheme.labelLarge),
          verticalSpace(10),
          Text(
            "أدخل الرمز المكون من 4 أرقام المرسل إلى بريدك الإلكتروني",
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
            ),
          ),
          verticalSpace(20),
          PinCodeFieldWidget(),
          verticalSpace(10),
          CustomAuthButtonWidget(
            text: "تأكيد",
            onPressed: () async {
              if (verifyOtpCubit.otp.length == 6) {
                await verifyOtpCubit.verifyOtp(
                  email: verifyOtpCubit.email,
                  otp: verifyOtpCubit.otp,
                );
              }
            },
            color: AppColors.kBlack,
          ),
          NavigateToLoginWidget(),
          CustomPromAuthWidget(
            text: "لم يصلك الرمز؟ ",
            textButton: "إعادة إرسال",
            onPressed: () async{
            await  verifyOtpCubit.forgetPassword();
            },
          ),
        ],
      ),
    );
  }
}
