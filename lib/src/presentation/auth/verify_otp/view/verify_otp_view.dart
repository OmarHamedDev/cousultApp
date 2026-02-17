import 'package:flutter/material.dart';
import '../widget/verify_otp_body_widget.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: VerifyOtpBodyWidget()
    );
  }
}