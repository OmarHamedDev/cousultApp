part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoadingState extends ChangePasswordState {}
class ChangePasswordSuccessState extends ChangePasswordState {}
class ChangePasswordErrorState extends ChangePasswordState{
  final String message;
  ChangePasswordErrorState(this.message);
}

class ChangeIconPasswordVisibilityState extends ChangePasswordState {}
