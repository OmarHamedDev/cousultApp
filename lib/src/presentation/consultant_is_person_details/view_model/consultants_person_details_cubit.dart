import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/consultants_person_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/get_consultants_person_use_case.dart';

part 'consultants_person_details_state.dart';

@injectable
class ConsultantsPersonDetailCubit
    extends Cubit<ConsultantsPersonDetailsState> {
  final GetConsultantsPersonUseCase getConsultantsPersonUseCase;
  ConsultantsPersonDetailCubit(this.getConsultantsPersonUseCase)
    : super(ConsultantsPersonDetailsUseCaseInitial());
  ConsultantsPersonEntity? consultantsPersonEntity;
  Future<void> getConsultantsPerson({required String id}) async {
    print("person  ID :$id");
    emit(ConsultantsPersonDetailsLoading());
    var result = await getConsultantsPersonUseCase.call(id: id);
    switch (result) {

      case Success<ConsultantsPersonEntity>():
       print(1);
        consultantsPersonEntity = result.date;
        emit(ConsultantsPersonDetailsLoaded());
        break;
      case Failures<ConsultantsPersonEntity>():
        print(result.exception);
        emit(
          ConsultantsPersonDetailsError(message: result.exception.toString()),
        );
        break;
    }
  }
}
