
import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/use_case/auth/login_auth_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginAuthUseCase loginAuthUseCase;
  LoginCubit(this.loginAuthUseCase) : super(LoginInitial());

  bool isPasswordVisible = false;
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginPasswordVisibilityChanged());
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 var formKey = GlobalKey<FormState>();

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    final result = await loginAuthUseCase.call(email, password);
    switch (result) {
      case Success<String>():
        emit(LoginSuccessState());
        break;
      case Failures<String>():
        emit(LoginErrorState(result.exception));
        break;
    }
  }
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }

}
