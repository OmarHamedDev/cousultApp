import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:flutter/material.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';
import '../view_model/verify_otp_cubit.dart';

class HandleBlocListenerVerifyOtp extends StatelessWidget {
  final Widget child;
  const HandleBlocListenerVerifyOtp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        }
        else if (state is VerifyOtpErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "كود التحقق غير صحيح",
            desc: state.errorMassage.toString(),
            onOk: () {},
            dialogType: DialogType.error,
          );
        }
        else if (state is VerifyOtpSuccessState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "تم التحقق بنجاح", // نص يوحي بالإنجاز
            dismiss: false,
            desc: "تم التأكد من هويتك، يمكنك الآن تعيين كلمة مرور جديدة لحسابك.",
            onOk: () async {
              await context.push(
                PageRouteName.resetPassword,
                extra: (
                context.read<VerifyOtpCubit>().email,
                context.read<VerifyOtpCubit>().otp
                ),
              );
            },
            dialogType: DialogType.success,
          );
        }
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
      },
      child: child,
    );
  }
}