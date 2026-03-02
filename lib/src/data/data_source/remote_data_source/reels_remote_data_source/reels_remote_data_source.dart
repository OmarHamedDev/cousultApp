import '../../../model/response/reels_response_model/reels_response_model.dart';

abstract class ReelsRemoteDataSource {
  Future<ReelsResponseModel>getAllReels();
}