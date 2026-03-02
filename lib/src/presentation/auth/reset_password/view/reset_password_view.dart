import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../view_model/reset_password_cubit.dart';
import '../widget/handle_bloc_listener_reset_password_widget.dart';
import '../widget/reset_password_body_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var resetPasswordCubit = context.read<ResetPasswordCubit>();
    final extraData = GoRouter.of(context).state.extra as (String, String)?;
    if (extraData != null) {
      final (email, otp) = extraData;
      resetPasswordCubit.email = email;
      resetPasswordCubit.otp = otp;
    }

    return Scaffold(
      body: HandleBlocListenerResetPasswordWidget(
        child: ResetPasswordBodyWidget(),
      ),
    );
  }
}
