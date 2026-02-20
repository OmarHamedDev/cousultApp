import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/request/change_password_request/change_password_request_model.dart';
import '../../../../domain/use_case/auth/change_password_use_case.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordCubit(this.changePasswordUseCase)
    : super(ChangePasswordInitial());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isCurrentPasswordVisible = true;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangeIconPasswordVisibilityState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangeIconPasswordVisibilityState());
  }

  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    emit(ChangeIconPasswordVisibilityState());
  }

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(ChangePasswordLoadingState());
      var result = await changePasswordUseCase.changePassword(
        changePasswordRequest: ChangePasswordRequestModel(
          currentPassword: passwordController.text,
          newPassword: passwordController.text,
        ),
      );
      switch (result) {
        case Success<String>():
          emit(ChangePasswordSuccessState());
          break;
        case Failures<String>():
          emit(ChangePasswordErrorState(result.exception));
          break;
      }
    }

    @override
    Future<void> close() {
      passwordController.dispose();
      confirmPasswordController.dispose();
      currentPasswordController.dispose();
      return super.close();
    }
  }
}
