import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart';
import '../../entities/app_user_entity.dart';

@injectable
class GetProfileUseCase {
  final AuthRepository authRepository;
  GetProfileUseCase(this.authRepository);
  Future<Result<AppUserEntity>> call() async {
    return await authRepository.getProfile();
  }
}
