import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:consult_app/src/data/model/request/change_password_request/change_password_request_model.dart';
import 'package:consult_app/src/data/model/request/login_request/Login_request.dart';
import 'package:consult_app/src/data/model/request/profile_request/Profile_request.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
import 'package:consult_app/src/data/model/response/auth_response_model/auth_response_model.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';
import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthOfflineDataSource authOfflineDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource, this.authOfflineDataSource);

  @override
  Future<Result<String>> registerWithEmailAndPasswordAccount(
    RegisterRequest registerRequest,
  ) async {
    return executeApi(
      apiCall: () async {
        AuthResponseModel authResponseModel = await authRemoteDataSource
            .registerWithEmailAndPasswordAccount(registerRequest);
        await authOfflineDataSource.saveToken(
          token: authResponseModel.data?.tokens?.accessToken ?? "",
        );
        return "Successes";
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
  Future<Result<AppUserEntity>> editProfile(
    ProfileRequest profileRequest,
  ) async {
    return executeApi(
      apiCall: () async {
        var appUserResponseModel = await authRemoteDataSource.editProfile(
          profileRequest,
        );
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
  Future<Result<String>> login(String email, String password) async {
    return executeApi(
      apiCall: () async {
        var authResponseModel = await authRemoteDataSource.login(
          LoginRequest(email: email, password: password),
        );
        await authOfflineDataSource.saveToken(
          token: authResponseModel.data?.tokens?.accessToken ?? "",
        );

        return "Successes";
      },
    );
  }

  @override
  Future<Result<String>> logoOut() async {
    return executeApi(
      apiCall: () async {
        // await authRemoteDataSource.logoOut();
        await authOfflineDataSource.deleteToken();
        return "Successes";
      },
    );
  }

  @override
  Future<Result<String>> forgetPassword({required String email}) async {
    return executeApi(
      apiCall: () async {
        await authRemoteDataSource.forgetPassword(email: email);
        return "تم إرسال رمز التحقق إلى بريدك الإلكتروني";
      },
    );
  }

  @override
  Future<Result<String>> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    return executeApi(
      apiCall: () async {
        await authRemoteDataSource.resetPassword(
          email: email,
          otp: otp,
          password: password,
        );
        return "تم تغير كلمة السر بنجاح ";
      },
    );
  }

  @override
  Future<Result<String>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return executeApi(
      apiCall: () async {
        await authRemoteDataSource.verifyOtp(email: email, otp: otp);
        return "تم التحقق من الرمز بنجاح ";
      },
    );
  }
}
