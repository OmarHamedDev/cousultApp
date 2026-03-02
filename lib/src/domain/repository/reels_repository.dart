import 'package:consult_app/core/api/common/api_result.dart';

import '../entities/reels_entity.dart';

abstract class ReelsRepository {
  Future<Result<List<ReelsEntity>>>getAllReels();
}