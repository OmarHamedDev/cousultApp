import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/reels_entity.dart';
import 'package:consult_app/src/domain/use_case/reels_use_case/get_all_reels_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'reels_state.dart';

@injectable
class ReelsCubit extends Cubit<ReelsState> {
  final GetAllReelsUseCase getAllReelsUseCase;
  ReelsCubit(this.getAllReelsUseCase) : super(ReelsInitial());
  List<ReelsEntity> reels = [];
  Future<void> getAllReels() async {
    emit(GetAllReelsLoadingState());
    var result = await getAllReelsUseCase.getAllReels();
    switch (result) {
      case Success<List<ReelsEntity>>():
        reels = result.date;
        emit(GetAllReelsSuccessState());
        break;
      case Failures<List<ReelsEntity>>():
        emit(GetAllReelsErrorState(result.exception));
        break;
    }
  }
}
