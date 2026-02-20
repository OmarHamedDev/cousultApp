import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';
import 'package:consult_app/src/domain/use_case/auth/get_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit(this.getProfileUseCase) : super(ProfileInitial());

  AppUserEntity? appUserEntity;
  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    var result = await getProfileUseCase.call();
    switch (result) {
      case Success<AppUserEntity>():
        appUserEntity = result.date;
        emit(GetProfileSuccessState());
        break;
      case Failures<AppUserEntity>():
        emit(GetProfileErrorState(result.exception));
        break;
    }
  }
}
