part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
class GetProfileLoadingState extends ProfileState{}
class GetProfileSuccessState extends ProfileState{}
class GetProfileErrorState extends ProfileState{
  final String message;
  GetProfileErrorState(this.message);
}
class LogoOutLoadingState extends ProfileState{}
class LogoOutSuccessState extends ProfileState{}
class LogoOutErrorState extends ProfileState{
  final String message;
  LogoOutErrorState(this.message);

}