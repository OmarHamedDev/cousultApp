import 'package:consult_app/core/api/common/api_result.dart';

import '../../data/model/request/user_booking_with_payment_request_model/User_booking_with_payment_request_model.dart';

abstract class PaymentRepository {
  Future<Result<String>>getUserBookingWithPayment(
      UserBookingWithPaymentRequestModel userBookingWithPaymentRequestModel,
      );
}