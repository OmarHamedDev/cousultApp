import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/core/api/common/execute_api_method.dart';

import 'package:consult_app/src/domain/entities/consultants_entity.dart';
import 'package:consult_app/src/domain/entities/consultants_person_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/consultants_repository.dart';
import '../data_source/remote_data_source/consultants_remote_data_source/consultants_remote_data_source.dart';

@Injectable(as: ConsultantsRepository)
class ConsultantRepositoryImpl implements ConsultantsRepository {
  final ConsultantsRemoteDataSource consultantsRemoteDataSource;
  ConsultantRepositoryImpl(this.consultantsRemoteDataSource);
  @override
  Future<Result<List<ConsultantsEntity>>> getAllConsultants({
    String? search,
    String? services,
    String? sortBy,
    String? order,
  }) {
    return executeApi(
      apiCall: () async {
        var result = await consultantsRemoteDataSource.getAllConsultants(
          search: search,
          services: services,
          sortBy: sortBy,
          order: order,
        );
        return result.data!
            .map(
              (e) => ConsultantsEntity(
                name: e.name ?? "",
                publicId: e.publicId ?? "",
                title: e.title ?? "",
                avatar: e.avatar ?? "",
                rating: e.rating ?? 0,
                sessionDuration: e.sessionDuration ?? 0,
                reviews: e.count?.reviews ?? 0,
              ),
            )
            .toList();
      },
    );
  }

  @override
  Future<Result<ConsultantsPersonEntity>> getConsultantsPersonById({
    required String id,
  }) async {
    return executeApi(
      apiCall: () async {
        var result = await consultantsRemoteDataSource.getConsultantsPersonById(
          id: id,
        );
        ConsultantsPersonEntity entity = ConsultantsPersonEntity(
          personId: result.data?.id ?? "",
          publicId: result.data?.publicId ?? "",
          title: result.data?.title ?? "",
          avatar: result.data?.avatar ?? "",
          service: "",
          name: result.data?.name ?? "",
          // service: result.data?.services?.first ?? "",
          rating: result.data?.rating ?? 0,
          sessionDuration: result.data?.sessionDuration ?? 0,
          reviews: result.data?.rating ?? 0,
          description: result.data?.description ?? "",
          experienceYears: result.data?.experienceYears ?? 0,
          proofPurpose: result.data?.proofPurpose ?? "",
          proofDocuments: result.data?.proofDocuments ?? [],
          sessionPrice: result.data?.sessionPrice ?? 0,
          totalBalance: result.data?.totalBalance ?? 0,
          availableBalance: result.data?.availableBalance ?? 0,
          status: result.data?.status ?? "",
          reason: result.data?.reason ?? "",
          haveUpdate: result.data?.haveUpdate ?? false,
        );

        return entity;
      },
    );
  }
}
