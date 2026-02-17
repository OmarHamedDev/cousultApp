import 'package:injectable/injectable.dart';

import '../../../core/api/common/api_result.dart';
import '../entities/consultants_entity.dart';
import '../repository/consultants_repository.dart';

@injectable
class GetAllConsultantsUseCase {
  final ConsultantsRepository consultantsRepository;
  GetAllConsultantsUseCase(this.consultantsRepository);
  Future<Result<List<ConsultantsEntity>>> call({
    String? search,
    String? services,
    String? sortBy,
    String? order,
  }) async {
    return await consultantsRepository.getAllConsultants(
      search: search,
      services: services,
      sortBy: sortBy,
      order: order,
    );
  }
}
