import '../../../model/request/register_request/Register_request.dart';

abstract class AuthRemoteDataSource {
  Future<String> registerWithEmailAndPasswordAccount(RegisterRequest registerRequest);
}