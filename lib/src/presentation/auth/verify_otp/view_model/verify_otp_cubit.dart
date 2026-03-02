import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/use_case/auth/forget_password_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_case/auth/verify_reset_code_use_case.dart';

part 'verify_otp_state.dart';

@injectable
class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyResetCodeUseCase verifyOtpUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  VerifyOtpCubit(this.verifyOtpUseCase, this.forgetPasswordUseCase)
    : super(VerifyOtpInitial());

  String email = "";
  String otp = "";
  Future<void> verifyOtp({required String email, required String otp}) async {
    emit(VerifyOtpLoadingState());
    var result = await verifyOtpUseCase.invoke(email: email, otp: otp);
    switch (result) {
      case Success<String>():
        emit(VerifyOtpSuccessState(result.date));
        break;
      case Failures<String>():
        emit(VerifyOtpErrorState(result.exception));
        break;
    }
  }

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var result = await forgetPasswordUseCase.invoke(email: email);
    switch (result) {
      case Success<String>():
        emit(ForgetPasswordSuccessState(result.date));
        break;
      case Failures<String>():
        emit(ForgetPasswordErrorState(result.exception));
        break;
    }
  }
}
