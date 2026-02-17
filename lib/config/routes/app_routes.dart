import 'package:consult_app/config/routes/page_route_name.dart';
import 'package:consult_app/src/presentation/auth/forget_password/view/forget_password_view.dart';
import 'package:consult_app/src/presentation/auth/login/view/login_view.dart';
import 'package:consult_app/src/presentation/auth/reset_password/view/reset_password_view.dart';
import 'package:consult_app/src/presentation/auth/verify_otp/view/verify_otp_view.dart';
import 'package:consult_app/src/presentation/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../src/presentation/auth/register/view/register_view.dart';
import '../../src/presentation/consultant_is_person_details/view/consultant_is_details_view.dart';
import '../../src/presentation/main/view/main_view.dart';

class AppRoutes {

  static final GoRouter router = GoRouter(
    initialLocation: PageRouteName.mainScreen,
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: PageRouteName.splash,
        builder: (context, state) =>  SplashView(),
      ),
      GoRoute(
        path: PageRouteName.mainScreen,
        builder: (context, state) =>  MainView(),
      ),
      GoRoute(
        path: PageRouteName.consultantIsDetailsView,
        builder: (context, state) =>  ConsultantDetailsView(),
      ),
      GoRoute(
        path: PageRouteName.registerScreen,
        builder: (context, state) =>  RegisterView(),
      ),
      GoRoute(
        path: PageRouteName.loginScreen,
        builder: (context, state) =>  LoginView(),
      ),
      GoRoute(
        path: PageRouteName.forgetPassword,
        builder: (context, state) =>  ForgetPasswordView(),
      ),
      GoRoute(
        path: PageRouteName.verifyOtpEmail,
        builder: (context, state) =>  VerifyOtpView(),
      ),
      GoRoute(
        path: PageRouteName.resetPassword,
        builder: (context, state) =>  ResetPasswordView(),
      )
    ],
  );
}
