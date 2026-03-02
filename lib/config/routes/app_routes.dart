import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/dependency_injection/di.dart';
import 'package:consult_app/src/presentation/about_as/view/about_as_view.dart';
import 'package:consult_app/src/presentation/auth/change_password/view/change_password_view.dart';
import 'package:consult_app/src/presentation/auth/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:consult_app/src/presentation/auth/forget_password/view/forget_password_view.dart';
import 'package:consult_app/src/presentation/auth/forget_password/view_model/forget_password_cubit.dart';
import 'package:consult_app/src/presentation/auth/login/view/login_view.dart';
import 'package:consult_app/src/presentation/auth/reset_password/view/reset_password_view.dart';
import 'package:consult_app/src/presentation/auth/verify_otp/view/verify_otp_view.dart';
import 'package:consult_app/src/presentation/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../src/domain/entities/app_user_entity.dart';
import '../../src/presentation/auth/edit_profile/view/edit_profile_view.dart';
import '../../src/presentation/auth/register/view/register_view.dart';
import '../../src/presentation/auth/reset_password/view_model/reset_password_cubit.dart';
import '../../src/presentation/auth/verify_otp/view_model/verify_otp_cubit.dart';
import '../../src/presentation/available_date_consultants_view/view/available_date_consultants_view.dart';
import '../../src/presentation/available_date_consultants_view/view_model/available_date_consultants_cubit.dart';
import '../../src/presentation/bookings_user/view/booking_user_view.dart';
import '../../src/presentation/consultant_is_person_details/view/consultant_is_details_view.dart';
import '../../src/presentation/main/view/main_view.dart';
import '../../src/presentation/notification/view/notification_view.dart';
import '../../src/presentation/notification/view_model/notification_cubit.dart';
import '../../src/presentation/privacy_policy/view/privacy_policy.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: PageRouteName.splash,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: PageRouteName.splash,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: PageRouteName.aboutAs,
        builder: (context, state) => AboutAsView(),
      ),
      GoRoute(
        path: PageRouteName.privacyPolicy,
        builder: (context, state) => PrivacyPolicyView(),
      ),
      GoRoute(
        path: PageRouteName.mainScreen,
        builder: (context, state) => MainView(),
      ),
      GoRoute(
        path: PageRouteName.consultantIsDetailsView,
        builder: (context, state) => ConsultantDetailsView(),
      ),
      GoRoute(
        path: PageRouteName.registerScreen,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: PageRouteName.loginScreen,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: PageRouteName.forgetPassword,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt.get<ForgetPasswordCubit>(),
              child: ForgetPasswordView(),
            ),
      ),

      GoRoute(
        path: PageRouteName.verifyOtpEmail,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt.get<VerifyOtpCubit>(),
              child: VerifyOtpView(),
            ),
      ),
      GoRoute(
        path: PageRouteName.resetPassword,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt.get<ResetPasswordCubit>(),
              child: ResetPasswordView(),
            ),
      ),
      GoRoute(
        path: PageRouteName.changePassword,
        builder: (context, state) => ChangePasswordView(),
      ),
      GoRoute(
        path: PageRouteName.avilableDateView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt.get<AvailableDateConsultantsCubit>(),
              child: AvailableDateConsultantsView(),
            ),
      ),
      GoRoute(
        path: PageRouteName.editProfile,
        builder: (context, state) {
          final userEntity = state.extra as AppUserEntity;
          return BlocProvider<EditProfileCubit>(
            create: (context) => getIt.get<EditProfileCubit>(),
            child: EditProfileView(userEntity: userEntity),
          );
        },
      ),
      GoRoute(
        path: PageRouteName.bookingUser,
        builder: (context, state) {
          return BookingUserView();
        },
      ),
      GoRoute(
        path: PageRouteName.notification,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
            getIt.get<NotificationCubit>()
              ..getAllNotification(),
            child: NotificationView(),
          );
        },
      ),
    ],
  );
}
