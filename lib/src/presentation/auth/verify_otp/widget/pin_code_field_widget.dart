import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../view_model/verify_otp_cubit.dart';

class PinCodeFieldWidget extends StatelessWidget {
  const PinCodeFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var verifyOtpCubit = context.read<VerifyOtpCubit>();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        onChanged: (value) {
          if (value.length == 6) {
            print("success :${value.length}");
            verifyOtpCubit.otp = value;
          }
        },
        length: 6,
        onCompleted: (value) {
          if (value.length == 6) {
            verifyOtpCubit.verifyOtp(email: verifyOtpCubit.email, otp: value);
          }
        },
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12.r),
          selectedColor: Colors.white,
          selectedFillColor: Colors.white.withOpacity(0.2),
          activeColor: Colors.white,
          activeFillColor: Colors.white.withOpacity(0.1),
          inactiveColor: Colors.white.withOpacity(0.5),
          inactiveFillColor: Colors.transparent,
          fieldHeight: 60.h,
          fieldWidth: 45.w,

          borderWidth: 1.5,
        ),
        cursorColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        appContext: context,
      ),
    );
  }
}
