import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart';

@injectable
class LogoOutUseCase {
  final AuthRepository authRepository;
  LogoOutUseCase(this.authRepository);
  Future<Result<String>> call() {
    return authRepository.logoOut();
  }

}