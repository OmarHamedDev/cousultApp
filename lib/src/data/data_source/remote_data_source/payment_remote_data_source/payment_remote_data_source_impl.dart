import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/payment_remote_data_source/payment_remote_data_source.dart';
import 'package:consult_app/src/data/model/request/user_booking_with_payment_request_model/User_booking_with_payment_request_model.dart';
import 'package:consult_app/src/data/model/response/user_booking_with_payment_response_model/user_booking_with_payment_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRemoteDataSource)
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiManger apiManger;
  PaymentRemoteDataSourceImpl(this.apiManger);
  @override
  Future<UserBookingWithPaymentResponseModel> getUserBookingWithPayment(
    UserBookingWithPaymentRequestModel userBookingWithPaymentRequestModel,
  ) async {
    return await apiManger.getAllUserAppointmentsWithPayment(
        userBookingWithPaymentRequestModel.toJson()
      // dayOfWeek: userBookingWithPaymentRequestModel.dayOfWeek ?? "",
      // date: userBookingWithPaymentRequestModel.date ?? "",
      // id: userBookingWithPaymentRequestModel.consultantId ?? "",
      // startDate: userBookingWithPaymentRequestModel.startTime?.toInt() ?? 0,
    );
  }
}
