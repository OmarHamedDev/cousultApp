import 'package:injectable/injectable.dart';
import '../../../../core/api/common/api_result.dart';
import '../../repository/auth_repository.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepository authRepository;
  VerifyResetCodeUseCase({required this.authRepository});
  Future<Result<String>> invoke({
    required String email,
    required String otp,
  }) async {
    return authRepository.verifyOtp(email: email, otp: otp);
  }
}
