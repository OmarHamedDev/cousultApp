import 'package:injectable/injectable.dart';

import '../../../core/api/common/api_result.dart';
import '../entities/consultants_person_entity.dart';
import '../repository/consultants_repository.dart';
@injectable
class GetConsultantsPersonUseCase {
  final ConsultantsRepository consultantsRepository;
  GetConsultantsPersonUseCase(this.consultantsRepository);
  Future<Result<ConsultantsPersonEntity>> call({required String id}) async {
    return await consultantsRepository.getConsultantsPersonById(id: id);
  }
}
