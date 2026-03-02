import 'package:consult_app/src/presentation/auth/forget_password/widget/custom_forget_password_body_widget.dart';
import 'package:flutter/material.dart';

import '../widget/handle_bloc_listener_forget_password_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: HandleBlocListenerForgetPasswordWidget(
        child: CustomForgetPasswordBodyWidget(),
      ),
    );
  }
}
