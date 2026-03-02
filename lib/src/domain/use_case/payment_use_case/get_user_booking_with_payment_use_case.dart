import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/repository/payment_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/request/user_booking_with_payment_request_model/User_booking_with_payment_request_model.dart';

@injectable
class GetUserBookingWithPaymentUseCase {
  final PaymentRepository paymentRepository;
  GetUserBookingWithPaymentUseCase(this.paymentRepository);
  Future<Result<String>> call({
    required UserBookingWithPaymentRequestModel
    userBookingWithPaymentRequestModel,
  }) {
    return paymentRepository.getUserBookingWithPayment(
      userBookingWithPaymentRequestModel,
    );
  }
}
