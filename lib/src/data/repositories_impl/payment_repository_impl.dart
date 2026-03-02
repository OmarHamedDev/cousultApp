import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/payment_remote_data_source/payment_remote_data_source.dart';
import 'package:consult_app/src/data/model/request/user_booking_with_payment_request_model/User_booking_with_payment_request_model.dart';
import 'package:consult_app/src/domain/repository/payment_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepository)
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource paymentRemoteDataSource;
  PaymentRepositoryImpl(this.paymentRemoteDataSource);
  @override
  Future<Result<String>> getUserBookingWithPayment(
    UserBookingWithPaymentRequestModel userBookingWithPaymentRequestModel,
  ) {
    return executeApi(
      apiCall: () async {
        var result = await paymentRemoteDataSource.getUserBookingWithPayment(
          userBookingWithPaymentRequestModel,
        );
        return result.data?.payment?.iframeUrl ?? "";
      },
    );
  }
}
