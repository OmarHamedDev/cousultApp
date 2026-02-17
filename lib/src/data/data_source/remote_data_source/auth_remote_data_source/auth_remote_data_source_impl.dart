import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/model/request/register_request/Register_request.dart';
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
}
