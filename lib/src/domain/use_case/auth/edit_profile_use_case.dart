import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/common/api_result.dart';
import '../../../data/model/request/profile_request/Profile_request.dart';
import '../../entities/app_user_entity.dart';

@injectable
class EditProfileUseCase {
  final AuthRepository authRepository;
  EditProfileUseCase(this.authRepository);
  Future<Result<AppUserEntity>> editProfile(
    ProfileRequest profileRequest,
  ) async {
    return authRepository.editProfile(profileRequest);
  }
}
