part of 'reels_cubit.dart';

@immutable
sealed class ReelsState {}

final class ReelsInitial extends ReelsState {}
class GetAllReelsLoadingState extends ReelsState{}
class GetAllReelsSuccessState extends ReelsState{}
class GetAllReelsErrorState extends ReelsState{
  final String message;
  GetAllReelsErrorState(this.message);

}