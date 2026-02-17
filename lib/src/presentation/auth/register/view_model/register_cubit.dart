import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/use_case/auth/register_with_email_and_password_account_use_case.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterWithEmailAndPasswordAccountUseCase
  registerWithEmailAndPasswordAccountUseCase;
  RegisterCubit(this.registerWithEmailAndPasswordAccountUseCase)
    : super(RegisterInitial());

  bool isPasswordVisible = true;
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  TextEditingController nameController = TextEditingController(
    text: 'omar',
  );
  TextEditingController emailController = TextEditingController(
    text: 'omarmakram@gmail.com',
  );
  TextEditingController passwordController = TextEditingController(
    text: '12345678',
  );
  TextEditingController phoneController = TextEditingController(
    text:  "01154544334"
  );
  TextEditingController countryCodeController = TextEditingController(
    text:  "EG"
  );
   GlobalKey<FormState>formKey=GlobalKey<FormState>();
  RegisterRequest get registerRequest {
    return RegisterRequest(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: "+20${phoneController.text}",
      countryCode: countryCodeController.text,
    );
  }

  Future<void> registerWithEmailAndPasswordAccount() async {
    emit(RegisterWithEmailAndPasswordAccountLoadingState());
    var result = await registerWithEmailAndPasswordAccountUseCase
        .registerWithEmailAndPasswordAccount(registerRequest: registerRequest);
    switch (result) {
      case Success<String>():
        emit(RegisterWithEmailAndPasswordAccountSuccessState());
        break;
      case Failures<String>():
        emit(
          RegisterWithEmailAndPasswordAccountErrorState(
            result.exception.toString(),
          ),
        );
        break;
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    print("OmarMakramDater");
    return super.close();
  }
}
