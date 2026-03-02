import 'package:consult_app/src/data/api/api_manger.dart';
import 'package:consult_app/src/data/data_source/remote_data_source/reels_remote_data_source/reels_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../model/response/reels_response_model/reels_response_model.dart';

@Injectable(as: ReelsRemoteDataSource)
class ReelsRemoteDataSourceImpl implements ReelsRemoteDataSource {
  final ApiManger apiManger;
  ReelsRemoteDataSourceImpl(this.apiManger);
  @override
  Future<ReelsResponseModel> getAllReels() async {
    return await apiManger.getAllReels();
  }
}
