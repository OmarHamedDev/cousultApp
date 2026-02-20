import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/request/profile_request/Profile_request.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
import 'package:consult_app/src/data/model/response/profile_response_model/profile_response_model.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManger apiManger;
  AuthRemoteDataSourceImpl(this.apiManger);
  @override
  Future<String> registerWithEmailAndPasswordAccount(
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

}
