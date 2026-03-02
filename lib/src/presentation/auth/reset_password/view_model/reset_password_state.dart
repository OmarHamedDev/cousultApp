part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}
final class ResetPasswordLoadingState extends ResetPasswordState{}
final class ResetPasswordSuccessState extends ResetPasswordState{
  final String massage;
  ResetPasswordSuccessState(this.massage);
}
final class ResetPasswordErrorState extends ResetPasswordState{
  final String errorMassage;
  ResetPasswordErrorState(this.errorMassage);
}

class LoginPasswordVisibilityChanged extends ResetPasswordState {}