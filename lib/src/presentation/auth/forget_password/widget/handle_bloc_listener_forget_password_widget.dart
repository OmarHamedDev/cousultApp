import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/src/presentation/auth/forget_password/view_model/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';

class HandleBlocListenerForgetPasswordWidget extends StatelessWidget {
  final Widget child;
  const HandleBlocListenerForgetPasswordWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is ForgetPasswordError) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "فشل إرسال الكود",
            desc: state.message,
            onOk: () {},
            dialogType: DialogType.error,
          );
        } else if (state is ForgetPasswordSuccess) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            dismiss: false,
            title: "تفقد بريدك الإلكتروني",
            desc: "تم إرسال كود التحقق بنجاح. يرجى إدخال الكود في الشاشة التالية.",
            onOk: ()async {
             await context.push(
                PageRouteName.verifyOtpEmail,
                extra: context.read<ForgetPasswordCubit>().emailController.text,
              );
              context.read<ForgetPasswordCubit>().dispose();
            },
            dialogType: DialogType.success,
          );
        }
      },
      child: child,
    );
  }
}
