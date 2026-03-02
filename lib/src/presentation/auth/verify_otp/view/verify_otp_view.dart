import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import '../view_model/verify_otp_cubit.dart';
import '../widget/handle_bloc_listener_verify_otp.dart';
import '../widget/verify_otp_body_widget.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    var verifyOtpCubit = context.read<VerifyOtpCubit>();
    verifyOtpCubit.email = GoRouter.of(context).state.extra as String;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: HandleBlocListenerVerifyOtp(child: VerifyOtpBodyWidget()),
    );
  }
}
