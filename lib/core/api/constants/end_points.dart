class EndPoints {
  static const String consultants = "consultants";

  static const String registerWithEmailAndPassword
  = "auth/signup";
  static const String loginWithEmailAndPassword
  = "auth/login";
  static const String registerWithGoogle=
  "/auth/providers-login";
  static const String forgetPassword = "auth/forgot-password";
  static const String verifyOtp = "auth/verify-otp";
  static const String resetPassword = "auth/reset-password";

  static const String logoOut = "auth/logout";
  static const String editProfile = "users";
  static const String profile = "users/me";
  static const String changePassword = "users";
  static const String notifications = "notifications";
  static const String bookings = "/user/bookings";
  static const String appointments="/appointments";
  static const String withPayment="/user/bookings/with-payment";
  static const String viewAllReels=
      "consultants/reels/featured";
}
