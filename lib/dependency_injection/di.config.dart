// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/caching/secure_storge/caching_Data.dart' as _i283;
import '../core/caching/secure_storge/secure_storage.dart' as _i987;
import '../src/data/api/api_manger.dart' as _i793;
import '../src/data/api/network_factory.dart' as _i13;
import '../src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source.dart'
    as _i191;
import '../src/data/data_source/offline_data_source/auth_offline_data_source/auth_offline_data_source_impl.dart'
    as _i735;
import '../src/data/data_source/remote_data_source/appointments_data_source/appointments_data_source.dart'
    as _i4;
import '../src/data/data_source/remote_data_source/appointments_data_source/appointments_data_source_impl.dart'
    as _i748;
import '../src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i841;
import '../src/data/data_source/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i30;
import '../src/data/data_source/remote_data_source/consultants_remote_data_source/consultants_remote_data_source.dart'
    as _i699;
import '../src/data/data_source/remote_data_source/consultants_remote_data_source/consultants_remote_data_source_impl.dart'
    as _i677;
import '../src/data/data_source/remote_data_source/notification_remote_data_source/notification_remote_data_source.dart'
    as _i203;
import '../src/data/data_source/remote_data_source/notification_remote_data_source/notification_remote_data_source_impl.dart'
    as _i219;
import '../src/data/data_source/remote_data_source/payment_remote_data_source/payment_remote_data_source.dart'
    as _i450;
import '../src/data/data_source/remote_data_source/payment_remote_data_source/payment_remote_data_source_impl.dart'
    as _i858;
import '../src/data/data_source/remote_data_source/reels_remote_data_source/reels_remote_data_source.dart'
    as _i580;
import '../src/data/data_source/remote_data_source/reels_remote_data_source/reels_remote_data_source_impl.dart'
    as _i347;
import '../src/data/repositories_impl/appointments_repository_impl.dart'
    as _i352;
import '../src/data/repositories_impl/auth_repository_impl.dart' as _i267;
import '../src/data/repositories_impl/consultant_repository_impl.dart' as _i866;
import '../src/data/repositories_impl/notification_repository_impl.dart'
    as _i94;
import '../src/data/repositories_impl/payment_repository_impl.dart' as _i222;
import '../src/data/repositories_impl/reels_repository_impl.dart' as _i114;
import '../src/domain/repository/appointments_repository.dart' as _i719;
import '../src/domain/repository/auth_repository.dart' as _i365;
import '../src/domain/repository/consultants_repository.dart' as _i373;
import '../src/domain/repository/notification_repository.dart' as _i1067;
import '../src/domain/repository/payment_repository.dart' as _i503;
import '../src/domain/repository/reels_repository.dart' as _i146;
import '../src/domain/use_case/appointments_use_case/get_appointments_by_id_use_case.dart'
    as _i455;
import '../src/domain/use_case/auth/change_password_use_case.dart' as _i129;
import '../src/domain/use_case/auth/edit_profile_use_case.dart' as _i103;
import '../src/domain/use_case/auth/forget_password_use_case.dart' as _i949;
import '../src/domain/use_case/auth/get_profile_use_case.dart' as _i140;
import '../src/domain/use_case/auth/login_auth_use_case.dart' as _i506;
import '../src/domain/use_case/auth/logo_out_use_case.dart' as _i697;
import '../src/domain/use_case/auth/register_with_email_and_password_account_use_case.dart'
    as _i1058;
import '../src/domain/use_case/auth/reset_password_use_case.dart' as _i603;
import '../src/domain/use_case/auth/verify_reset_code_use_case.dart' as _i790;
import '../src/domain/use_case/get_all_consultants_use_case.dart' as _i801;
import '../src/domain/use_case/get_all_user_booking_use_case.dart' as _i514;
import '../src/domain/use_case/get_consultants_person_use_case.dart' as _i163;
import '../src/domain/use_case/notification_use_case/get_all_notification_use_case.dart'
    as _i697;
import '../src/domain/use_case/payment_use_case/get_user_booking_with_payment_use_case.dart'
    as _i705;
import '../src/domain/use_case/reels_use_case/get_all_reels_use_case.dart'
    as _i714;
import '../src/presentation/auth/change_password/view_model/change_password_cubit.dart'
    as _i994;
import '../src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart'
    as _i1030;
import '../src/presentation/auth/forget_password/view_model/forget_password_cubit.dart'
    as _i516;
import '../src/presentation/auth/login/view_model/login_cubit.dart' as _i78;
import '../src/presentation/auth/register/view_model/register_cubit.dart'
    as _i144;
import '../src/presentation/auth/reset_password/view_model/reset_password_cubit.dart'
    as _i638;
import '../src/presentation/auth/verify_otp/view_model/verify_otp_cubit.dart'
    as _i630;
import '../src/presentation/available_date_consultants_view/view_model/available_date_consultants_cubit.dart'
    as _i928;
import '../src/presentation/bookings_user/view_model/bookings_user_cubit.dart'
    as _i822;
import '../src/presentation/consultant_is_person_details/view_model/consultants_person_details_cubit.dart'
    as _i109;
import '../src/presentation/home/view_model/home_cubit.dart' as _i233;
import '../src/presentation/notification/view_model/notification_cubit.dart'
    as _i913;
import '../src/presentation/profile/view_model/profile_cubit.dart' as _i101;
import '../src/presentation/reels/view_model/reels_cubit.dart' as _i798;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i361.LogInterceptor>(() => dioProvider.providePretty());
    gh.factory<_i283.CachingDataSecureStorage>(
      () => _i987.SecureStorageFunction(),
    );
    gh.factory<_i793.ApiManger>(() => _i793.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i4.AppointmentsDataSource>(
      () => _i748.AppointmentsDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i699.ConsultantsRemoteDataSource>(
      () => _i677.ConsultantsRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i203.NotificationRemoteDataSource>(
      () => _i219.NotificationRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i191.AuthOfflineDataSource>(
      () => _i735.AuthOfflineDataSourceImpl(
        cachingData: gh<_i283.CachingDataSecureStorage>(),
      ),
    );
    gh.factory<_i719.AppointmentsRepository>(
      () => _i352.AppointmentsRepositoryImpl(gh<_i4.AppointmentsDataSource>()),
    );
    gh.factory<_i580.ReelsRemoteDataSource>(
      () => _i347.ReelsRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i450.PaymentRemoteDataSource>(
      () => _i858.PaymentRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i841.AuthRemoteDataSource>(
      () => _i30.AuthRemoteDataSourceImpl(gh<_i793.ApiManger>()),
    );
    gh.factory<_i1067.NotificationRepository>(
      () => _i94.NotificationRepositoryImpl(
        gh<_i203.NotificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i455.GetAppointmentsByIdUseCase>(
      () =>
          _i455.GetAppointmentsByIdUseCase(gh<_i719.AppointmentsRepository>()),
    );
    gh.factory<_i373.ConsultantsRepository>(
      () => _i866.ConsultantRepositoryImpl(
        gh<_i699.ConsultantsRemoteDataSource>(),
      ),
    );
    gh.factory<_i801.GetAllConsultantsUseCase>(
      () => _i801.GetAllConsultantsUseCase(gh<_i373.ConsultantsRepository>()),
    );
    gh.factory<_i514.GetAllUserBookingUseCase>(
      () => _i514.GetAllUserBookingUseCase(gh<_i373.ConsultantsRepository>()),
    );
    gh.factory<_i163.GetConsultantsPersonUseCase>(
      () =>
          _i163.GetConsultantsPersonUseCase(gh<_i373.ConsultantsRepository>()),
    );
    gh.factory<_i503.PaymentRepository>(
      () => _i222.PaymentRepositoryImpl(gh<_i450.PaymentRemoteDataSource>()),
    );
    gh.factory<_i146.ReelsRepository>(
      () => _i114.ReelsRepositoryImpl(gh<_i580.ReelsRemoteDataSource>()),
    );
    gh.factory<_i697.GetAllNotificationUseCase>(
      () =>
          _i697.GetAllNotificationUseCase(gh<_i1067.NotificationRepository>()),
    );
    gh.factory<_i365.AuthRepository>(
      () => _i267.AuthRepositoryImpl(
        gh<_i841.AuthRemoteDataSource>(),
        gh<_i191.AuthOfflineDataSource>(),
      ),
    );
    gh.factory<_i705.GetUserBookingWithPaymentUseCase>(
      () =>
          _i705.GetUserBookingWithPaymentUseCase(gh<_i503.PaymentRepository>()),
    );
    gh.factory<_i109.ConsultantsPersonDetailCubit>(
      () => _i109.ConsultantsPersonDetailCubit(
        gh<_i163.GetConsultantsPersonUseCase>(),
      ),
    );
    gh.factory<_i233.HomeCubit>(
      () => _i233.HomeCubit(gh<_i801.GetAllConsultantsUseCase>()),
    );
    gh.factory<_i949.ForgetPasswordUseCase>(
      () => _i949.ForgetPasswordUseCase(
        authRepository: gh<_i365.AuthRepository>(),
      ),
    );
    gh.factory<_i603.ResetPasswordUseCase>(
      () => _i603.ResetPasswordUseCase(
        authRepository: gh<_i365.AuthRepository>(),
      ),
    );
    gh.factory<_i790.VerifyResetCodeUseCase>(
      () => _i790.VerifyResetCodeUseCase(
        authRepository: gh<_i365.AuthRepository>(),
      ),
    );
    gh.factory<_i638.ResetPasswordCubit>(
      () => _i638.ResetPasswordCubit(gh<_i603.ResetPasswordUseCase>()),
    );
    gh.factory<_i928.AvailableDateConsultantsCubit>(
      () => _i928.AvailableDateConsultantsCubit(
        gh<_i705.GetUserBookingWithPaymentUseCase>(),
        gh<_i455.GetAppointmentsByIdUseCase>(),
      ),
    );
    gh.factory<_i822.BookingsUserCubit>(
      () => _i822.BookingsUserCubit(gh<_i514.GetAllUserBookingUseCase>()),
    );
    gh.factory<_i714.GetAllReelsUseCase>(
      () => _i714.GetAllReelsUseCase(gh<_i146.ReelsRepository>()),
    );
    gh.factory<_i913.NotificationCubit>(
      () => _i913.NotificationCubit(gh<_i697.GetAllNotificationUseCase>()),
    );
    gh.factory<_i129.ChangePasswordUseCase>(
      () => _i129.ChangePasswordUseCase(gh<_i365.AuthRepository>()),
    );
    gh.factory<_i103.EditProfileUseCase>(
      () => _i103.EditProfileUseCase(gh<_i365.AuthRepository>()),
    );
    gh.factory<_i140.GetProfileUseCase>(
      () => _i140.GetProfileUseCase(gh<_i365.AuthRepository>()),
    );
    gh.factory<_i506.LoginAuthUseCase>(
      () => _i506.LoginAuthUseCase(gh<_i365.AuthRepository>()),
    );
    gh.factory<_i697.LogoOutUseCase>(
      () => _i697.LogoOutUseCase(gh<_i365.AuthRepository>()),
    );
    gh.factory<_i1058.RegisterWithEmailAndPasswordAccountUseCase>(
      () => _i1058.RegisterWithEmailAndPasswordAccountUseCase(
        gh<_i365.AuthRepository>(),
      ),
    );
    gh.factory<_i1030.EditProfileCubit>(
      () => _i1030.EditProfileCubit(gh<_i103.EditProfileUseCase>()),
    );
    gh.factory<_i516.ForgetPasswordCubit>(
      () => _i516.ForgetPasswordCubit(gh<_i949.ForgetPasswordUseCase>()),
    );
    gh.factory<_i144.RegisterCubit>(
      () => _i144.RegisterCubit(
        gh<_i1058.RegisterWithEmailAndPasswordAccountUseCase>(),
      ),
    );
    gh.factory<_i630.VerifyOtpCubit>(
      () => _i630.VerifyOtpCubit(
        gh<_i790.VerifyResetCodeUseCase>(),
        gh<_i949.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i798.ReelsCubit>(
      () => _i798.ReelsCubit(gh<_i714.GetAllReelsUseCase>()),
    );
    gh.factory<_i101.ProfileCubit>(
      () => _i101.ProfileCubit(
        gh<_i140.GetProfileUseCase>(),
        gh<_i697.LogoOutUseCase>(),
      ),
    );
    gh.factory<_i78.LoginCubit>(
      () => _i78.LoginCubit(gh<_i506.LoginAuthUseCase>()),
    );
    gh.factory<_i994.ChangePasswordCubit>(
      () => _i994.ChangePasswordCubit(gh<_i129.ChangePasswordUseCase>()),
    );
    return this;
  }
}

class _$DioProvider extends _i13.DioProvider {}
