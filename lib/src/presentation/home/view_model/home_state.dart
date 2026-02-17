part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeHomeBodyWidgetState extends HomeState {}

class GetAllConsultantLoadingState extends HomeState {}

class GetAllConsultantSuccessState extends HomeState {}

class GetAllConsultantFailuresState extends HomeState {
  final String message;
  GetAllConsultantFailuresState(this.message);
}
class ChangeSelectedCategoryIndexState extends HomeState {}