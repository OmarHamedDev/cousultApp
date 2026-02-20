import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/request/change_password_request/change_password_request_model.dart';

@injectable
class ChangePasswordUseCase {
  final AuthRepository authRepository;
  ChangePasswordUseCase(this.authRepository);
  Future<Result<String>>changePassword({required ChangePasswordRequestModel changePasswordRequest})async{
    return authRepository.changePassword(changePasswordRequest: changePasswordRequest);
  }
}