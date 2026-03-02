part of 'verify_otp_cubit.dart';

@immutable
sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoadingState extends VerifyOtpState {}

class VerifyOtpErrorState extends VerifyOtpState {
  final String errorMassage;
  VerifyOtpErrorState(this.errorMassage);
}

class VerifyOtpSuccessState extends VerifyOtpState {
  final String massage;
  VerifyOtpSuccessState(this.massage);
}
class ForgetPasswordLoadingState extends VerifyOtpState{}
class ForgetPasswordSuccessState extends VerifyOtpState{
  final String massage;
  ForgetPasswordSuccessState(this.massage);
}
class ForgetPasswordErrorState extends VerifyOtpState{
  final String message;
  ForgetPasswordErrorState(this.message);
}