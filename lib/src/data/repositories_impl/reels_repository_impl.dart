import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/reels_remote_data_source/reels_remote_data_source.dart';
import 'package:consult_app/src/domain/entities/reels_entity.dart';
import 'package:consult_app/src/domain/repository/reels_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ReelsRepository)
class ReelsRepositoryImpl implements ReelsRepository {
  final ReelsRemoteDataSource reelsRemoteDataSource;
  ReelsRepositoryImpl(this.reelsRemoteDataSource);
  @override
  Future<Result<List<ReelsEntity>>> getAllReels() async {
    return executeApi(
      apiCall: () async {
        var response = await reelsRemoteDataSource.getAllReels();
        List<ReelsEntity> reels = [];
        if (response.data != null && response.data!.isNotEmpty) {
          return response.data!
              .map(
                (e) => ReelsEntity(
                  e.id ?? "",
                  e.videoUrl ?? "",
                  e.consultantId ?? "",
                  e.consultant?.name ?? "",
                  e.consultant?.avatar ?? "",
                ),
              )
              .toList();
        } else {
          reels = [];
          return reels;
        }
      },
    );
  }
}
