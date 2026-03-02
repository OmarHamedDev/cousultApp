import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/response/auth_response_model/auth_response_model.dart';
import 'package:consult_app/src/data/model/response/profile_response_model/profile_response_model.dart';

import '../../../model/request/login_request/Login_request.dart';
import '../../../model/request/profile_request/Profile_request.dart';
import '../../../model/request/register_request/Register_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> registerWithEmailAndPasswordAccount(
    RegisterRequest registerRequest,
  );
  Future<ProfileResponseModel> getProfile();
  Future<String> changePassword({
    required ChangePasswordRequestModel changePasswordRequestModel,
  });
  Future<ProfileResponseModel> editProfile(ProfileRequest profileRequest);
  Future<AuthResponseModel> login(LoginRequest loginRequest);
  Future<String> logoOut();

  Future<String>forgetPassword({required String email});
  Future<String> verifyOtp({required String email,required String otp});
  Future<String> resetPassword({required String email,required String otp,required String password});


}
