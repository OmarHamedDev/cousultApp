import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/use_case/auth/reset_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());
  String email = "";
  String otp = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.invoke(
      email: email,
      otp: otp,
      password: passwordController.text,
    );
    switch (result) {
      case Success<String>():
        emit(ResetPasswordSuccessState(result.date));
        break;
      case Failures<String>():
        emit(ResetPasswordErrorState(result.exception));
        break;
    }
  }
  bool isPasswordVisible = false;
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginPasswordVisibilityChanged());
  }

}
