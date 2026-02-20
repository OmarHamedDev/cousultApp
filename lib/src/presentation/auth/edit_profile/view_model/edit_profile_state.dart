part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
class EditProfileLoadingState extends EditProfileState {}
class EditProfileSuccessState extends EditProfileState {}
class EditProfileErrorState extends EditProfileState {
  final String message;
  EditProfileErrorState(this.message);
}