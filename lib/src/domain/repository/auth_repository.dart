import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/request/profile_request/Profile_request.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';

import '../../data/model/request/register_request/Register_request.dart';

abstract class AuthRepository {
  Future<Result<String>>registerWithEmailAndPasswordAccount(RegisterRequest registerRequest);
  Future<Result<AppUserEntity>>getProfile();
  Future<Result<String>>changePassword({required ChangePasswordRequestModel changePasswordRequest});
  Future<Result<AppUserEntity>>editProfile(ProfileRequest profileRequest);

}

