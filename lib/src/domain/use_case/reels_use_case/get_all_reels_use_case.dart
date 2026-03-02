import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/reels_entity.dart';
import 'package:consult_app/src/domain/repository/reels_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllReelsUseCase {
  final ReelsRepository reelsRepository;
  GetAllReelsUseCase(this.reelsRepository);
  Future<Result<List<ReelsEntity>>> getAllReels() async {
    return await reelsRepository.getAllReels();
  }
}
