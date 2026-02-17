part of 'consultants_person_details_cubit.dart';

@immutable
sealed class ConsultantsPersonDetailsState {}

final class ConsultantsPersonDetailsUseCaseInitial extends ConsultantsPersonDetailsState {}
class ConsultantsPersonDetailsLoading extends ConsultantsPersonDetailsState{}
class ConsultantsPersonDetailsLoaded extends ConsultantsPersonDetailsState{}
class ConsultantsPersonDetailsError extends ConsultantsPersonDetailsState{
  final String? message;
  ConsultantsPersonDetailsError({this.message});

}