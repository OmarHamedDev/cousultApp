import 'package:consult_app/core/api/common/api_result.dart';

import '../entities/consultants_entity.dart';
import '../entities/consultants_person_entity.dart';

abstract class ConsultantsRepository {
  Future<Result<List<ConsultantsEntity>>> getAllConsultants({
    String? search,
    String? services,
    String? sortBy,
    String? order,
  });
  Future<Result<ConsultantsPersonEntity>>getConsultantsPersonById({
    required String id,
  });

}
