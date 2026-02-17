part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class ChangePasswordVisibility extends RegisterState {}

class RegisterWithEmailAndPasswordAccountLoadingState extends RegisterState {}
class RegisterWithEmailAndPasswordAccountSuccessState extends RegisterState {}
class RegisterWithEmailAndPasswordAccountErrorState extends RegisterState{
  final String errorMassage;
  RegisterWithEmailAndPasswordAccountErrorState(this.errorMassage);
}