import 'package:injectable/injectable.dart';
import '../../../../core/api/common/api_result.dart';
import '../../repository/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepository authRepository;
  ResetPasswordUseCase({required this.authRepository});
  Future<Result<String>> invoke({
    required String email,
    required String otp,
    required String password,
  }) async {
    return authRepository.resetPassword(
      email: email,
      otp: otp,
      password: password,
    );
  }
}
