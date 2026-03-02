import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_case/auth/forget_password_use_case.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordCubit(this.forgetPasswordUseCase)
    : super(ForgetPasswordInitial());
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    var result = await forgetPasswordUseCase.invoke(email: email);
    switch (result) {
      case Success<String>():
        emit(ForgetPasswordSuccess(result.date));
        break;
      case Failures<String>():
        emit(ForgetPasswordError(result.exception));
        break;
    }
  }
 void dispose(){
   super.close();
    emailController.dispose();
  }
}
