import 'package:consult_app/core/api/common/api_result.dart';

import '../../data/model/request/register_request/Register_request.dart';

abstract class AuthRepository {
  Future<Result<String>>registerWithEmailAndPasswordAccount(RegisterRequest registerRequest);
}