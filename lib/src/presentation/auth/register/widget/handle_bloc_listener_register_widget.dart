import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:consult_app/src/presentation/auth/register/view_model/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/page_route_name.dart';
import '../../../../../core/utils/functions/dialogs/awesome_dialoge.dart';
import '../../../../../core/utils/functions/dialogs/handle_snake_bar_dialog.dart';

class HandleBlocListenerRegisterWidget extends StatelessWidget {
  final Widget child;
  const HandleBlocListenerRegisterWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterWithEmailAndPasswordAccountLoadingState) {
          HandleSnakeBarDialog.showLoadingDialog(context);
        } else if (state is RegisterWithEmailAndPasswordAccountErrorState) {
          HandleSnakeBarDialog.popDialog(context);
          showAwesomeDialog(
            context,
            title: "حدث خطا  هنا",
            desc: state.errorMassage,
            onOk: () {},
            dialogType: DialogType.error,
          );
        } else if (state is RegisterWithEmailAndPasswordAccountSuccessState) {
          HandleSnakeBarDialog.popDialog(context);
          // context.read<RegisterCubit>().dispose();
          context.push(PageRouteName.mainScreen);
        }
      },
      child: child,
    );
  }
}
