import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/request/profile_request/Profile_request.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
import 'package:consult_app/src/data/model/response/auth_response_model/auth_response_model.dart';
import 'package:consult_app/src/data/model/response/profile_response_model/profile_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../model/request/login_request/Login_request.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManger apiManger;
  AuthRemoteDataSourceImpl(this.apiManger);
  @override
  Future<AuthResponseModel> registerWithEmailAndPasswordAccount(
    RegisterRequest registerRequest,
  ) async {
    return await apiManger.registerWithEmailAndPasswordAccount(
       registerRequest.toJson(),
    );
  }

  @override
  Future<ProfileResponseModel> getProfile()async {
    return await apiManger.getProfile();
  }

  @override
  Future<String> changePassword({required ChangePasswordRequestModel changePasswordRequestModel}) {
   return apiManger.changePassword(changePasswordRequestModel.toJson());
  }

  @override
  Future<ProfileResponseModel> editProfile(ProfileRequest profileRequest) {
    return apiManger.editProfile({
      "name":profileRequest.name,
      "avatar":profileRequest.avatar,
      "phone":profileRequest.phone,
      "countryCode":profileRequest.countryCode
    });
  }

  @override
  Future<AuthResponseModel> login(LoginRequest loginRequest) async{
    return await apiManger.loginWithEmailAndPasswordAccount(loginRequest.toJson());
  }
  @override
  Future<String> logoOut() {
    return apiManger.logoOut();
  }

  @override
  Future<String> forgetPassword({required String email}) async{
    return await apiManger.forgetPassword({"email":email});
  }

  @override
  Future<String> resetPassword({required String email, required String otp, required String password})async {
    return await apiManger.resetPassword({"email":email,"otp":otp,"password":password});
  }

  @override
  Future<String> verifyOtp({required String email, required String otp}) async{
    return await apiManger.verifyOtp({"email":email,"otp":otp});
  }
}
