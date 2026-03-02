import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart';
@injectable
class LoginAuthUseCase {
  final AuthRepository authRepository;
  LoginAuthUseCase(this.authRepository);
  Future<Result<String>> call(String email,String password){
    return authRepository.login(email, password);

  }
}