import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/src/presentation/auth/verify_otp/view_model/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import '../view_model/reset_password_cubit.dart';

class HandleBlocListenerResetPasswordWidget extends StatelessWidget {
  final Widget child;
  const HandleBlocListenerResetPasswordWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is ForgetPasswordErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "خطأ في الإرسال",
            desc: "تعذر إرسال كود التحقق، تأكد من البريد الإلكتروني وحاول مجدداً",
            dismiss: true,
            onOk: () {},
            dialogType: DialogType.error,
          );
        } else if (state is ForgetPasswordSuccessState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            dialogType: DialogType.success,
            dismiss: true,
            title: "تم الإرسال بنجاح",
            desc: "تم إرسال كود التحقق إلى بريدك الإلكتروني بنجاح",
            onOk: () {},
          );
        }
        if (state is ResetPasswordLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is ResetPasswordErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "فشل تحديث كلمة المرور",
            desc: state.errorMassage.toString(),
            onOk: () {},
            dialogType: DialogType.error,
          );
        } else if (state is ResetPasswordSuccessState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            dismiss: false,
            title: "تم تغيير كلمة المرور",
            desc: "تم تحديث كلمة المرور بنجاح، يمكنك الآن تسجيل الدخول بحسابك",
            onOk: () {
              context.go(PageRouteName.loginScreen);
            },
            dialogType: DialogType.success,
          );
        }
      },
      child: child,
    );
  }
}