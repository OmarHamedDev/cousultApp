import 'package:injectable/injectable.dart';
import '../../../../core/api/common/api_result.dart';
import '../../repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase{
  final AuthRepository authRepository;
  ForgetPasswordUseCase({required this.authRepository});
  Future<Result<String>>invoke({required String email})async{
    return authRepository.forgetPassword(email: email);
  }
}