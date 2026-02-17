import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart';
import '../../../data/model/request/register_request/Register_request.dart';

@injectable
class RegisterWithEmailAndPasswordAccountUseCase {
  final AuthRepository authRepository;
  RegisterWithEmailAndPasswordAccountUseCase(this.authRepository);
  Future<Result<String>> registerWithEmailAndPasswordAccount({
    required RegisterRequest registerRequest,
  }) async {
    return await authRepository.registerWithEmailAndPasswordAccount(
      registerRequest,
    );
  }
}
