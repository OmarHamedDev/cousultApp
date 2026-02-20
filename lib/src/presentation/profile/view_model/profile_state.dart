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