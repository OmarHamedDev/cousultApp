import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
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
}
