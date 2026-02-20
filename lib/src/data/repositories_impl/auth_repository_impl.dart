import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/request/profile_request/Profile_request.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';
import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Result<String>> registerWithEmailAndPasswordAccount(
    RegisterRequest registerRequest,
  ) async {
    return executeApi(
      apiCall: () {
        return authRemoteDataSource.registerWithEmailAndPasswordAccount(
          registerRequest,
        );
      },
    );
  }

  @override
  Future<Result<AppUserEntity>> getProfile() async {
    return executeApi(
      apiCall: () async {
        var appUserResponseModel = await authRemoteDataSource.getProfile();
        return AppUserEntity(
          id: appUserResponseModel.data?.id ?? "",
          email: appUserResponseModel.data?.email ?? "",
          userName: appUserResponseModel.data?.name ?? "",
          countryCode: appUserResponseModel.data?.countryCode ?? "",
          phone: appUserResponseModel.data?.phone ?? "",
          avatar: appUserResponseModel.data?.avatar ?? "",
          role: appUserResponseModel.data?.role ?? "",
          isVerified: appUserResponseModel.data?.isVerified ?? false,
        );
      },
    );
  }

  @override
  Future<Result<String>> changePassword({
    required ChangePasswordRequestModel changePasswordRequest,
  }) async {
    return executeApi(
      apiCall: () async {
        return await authRemoteDataSource.changePassword(
          changePasswordRequestModel: changePasswordRequest,
        );
      },
    );
  }

  @override
  Future<Result<AppUserEntity>> editProfile(ProfileRequest profileRequest) async{
    return executeApi(
      apiCall: () async {
        var appUserResponseModel = await authRemoteDataSource.editProfile(profileRequest);
        return AppUserEntity(
          id: appUserResponseModel.data?.id ?? "",
          email: appUserResponseModel.data?.email ?? "",
          userName: appUserResponseModel.data?.name ?? "",
          countryCode: appUserResponseModel.data?.countryCode ?? "",
          phone: appUserResponseModel.data?.phone ?? "",
          avatar: appUserResponseModel.data?.avatar ?? "",
          role: appUserResponseModel.data?.role ?? "",
          isVerified: appUserResponseModel.data?.isVerified ?? false,
        );
      },
    );
  }
}
