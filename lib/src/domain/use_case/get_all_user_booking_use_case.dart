import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/booking_user_entity.dart';
import 'package:injectable/injectable.dart';

import '../repository/consultants_repository.dart';

@injectable
class GetAllUserBookingUseCase {
  final ConsultantsRepository consultantsRepository;
  GetAllUserBookingUseCase(this.consultantsRepository);
  Future<Result<List<BookingUserEntity>>> call({String? status}) async {
    return await consultantsRepository.getAllUserBookings(status: status);
  }
}
