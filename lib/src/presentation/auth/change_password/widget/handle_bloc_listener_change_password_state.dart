import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart' show HandleSnakeBarDialog;
import '../view_model/change_password_cubit.dart';

class HandleBlocListenerChangePasswordState extends StatelessWidget {
  final Widget child;
  const HandleBlocListenerChangePasswordState({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is ChangePasswordErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "حدث خطا  هنا",
            desc: state.message,
            onOk: () {},
            dialogType: DialogType.error,
          );
        } else if (state is ChangePasswordSuccessState) {
          HandleSnakeBarDialog.popDialog(context); // قفل لودينج
          showAwesomeDialog(
            context,
            title: "تم بنجاح",
            desc: "تم تغيير كلمة المرور بنجاح",
            dialogType: DialogType.success,
            onOk: () {
              context.pop();
            },
            onDismiss: (type) {
              context.pop();
            },
          );
        }
      },
      child: child
    );
  }
}
