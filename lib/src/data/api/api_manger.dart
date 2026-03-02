import 'package:consult_app/core/api/constants/end_points.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/constants/api_constants.dart';
import '../model/response/appointments_response_model/appointments_response_model.dart';
import '../model/response/auth_response_model/auth_response_model.dart';
import '../model/response/booking_user_response_model/booking_user_response_model.dart';
import '../model/response/consultants_person_response_model/consultants_person_response_model.dart';
import '../model/response/consultants_response_model/consultants_response_model.dart';
import '../model/response/notifications_response_model/notifications_response_model.dart';
import '../model/response/profile_response_model/profile_response_model.dart';
import '../model/response/reels_response_model/reels_response_model.dart';
import '../model/response/user_booking_with_payment_response_model/user_booking_with_payment_response_model.dart';
part 'api_manger.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(Dio dio) = _ApiManger;

  @GET(EndPoints.consultants)
  Future<ConsultantsResponseModel> getAllConsultants({
    @Query("search") String? search,
    @Query("services") String? services,
    @Query("sortBy") String? sortBy,
    @Query("order") String? order,
  });
  @GET("${EndPoints.consultants}/{id}")
  Future<ConsultantsPersonResponseModel> getConsultantsPersonById({
    @Path("id") required String id,
  });
  @POST(EndPoints.registerWithEmailAndPassword)
  Future<AuthResponseModel> registerWithEmailAndPasswordAccount(
    @Body() Map<String, dynamic> registerRequest,
  );
  @POST(EndPoints.loginWithEmailAndPassword)
  Future<AuthResponseModel> loginWithEmailAndPasswordAccount(
    @Body() Map<String, dynamic> loginRequest,
  );
  @POST(EndPoints.forgetPassword)
  Future<String> forgetPassword(@Body() Map<String, dynamic>body );
  @POST(EndPoints.verifyOtp)
  Future<String> verifyOtp(@Body() Map<String, dynamic>body );
  @POST(EndPoints.resetPassword)
  Future<String> resetPassword(@Body() Map<String, dynamic>body );
  @GET(EndPoints.profile)
  Future<ProfileResponseModel> getProfile();
  @POST(EndPoints.logoOut)
  Future<String> logoOut();
  @PUT(EndPoints.changePassword)
  Future<String> changePassword(@Body() Map<String, dynamic> changePasswordMap);

  @PATCH(EndPoints.editProfile)
  Future<ProfileResponseModel> editProfile(
    @Body() Map<String, dynamic> profile,
  );
  @GET(EndPoints.notifications)
  Future<NotificationsResponseModel> getAllNotifications();
  @GET(EndPoints.bookings)
  Future<BookingUserResponseModel> getAllUserBookings({
    @Query("status") String? status,
  });
  @GET(EndPoints.appointments)
  Future<AppointmentsResponseModel>
  getAllUserAppointments({
    @Query("consultantId") required String id,
    @Query("date") required String startDate,
  });

  @POST(EndPoints.withPayment)
  Future<UserBookingWithPaymentResponseModel> getAllUserAppointmentsWithPayment(
    @Body()  Map<String,dynamic>  body
  );

  @GET(EndPoints.viewAllReels)
  Future<ReelsResponseModel>getAllReels();
}
