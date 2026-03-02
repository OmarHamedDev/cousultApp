import 'package:bloc/bloc.dart';
import 'package:consult_app/core/api/common/api_result.dart';
import 'package:consult_app/src/domain/entities/app_user_entity.dart';
import 'package:consult_app/src/domain/use_case/auth/get_profile_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/use_case/auth/logo_out_use_case.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final LogoOutUseCase logoOutUseCase;
  ProfileCubit(this.getProfileUseCase, this.logoOutUseCase)
    : super(ProfileInitial());

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

  Future<void> logout() async {
    emit(LogoOutLoadingState());
    var result = await logoOutUseCase.call();
    switch (result) {
      case Success<String>():
        emit(LogoOutSuccessState());
      case Failures<String>():
        emit(LogoOutErrorState(result.exception));
    }
  }
}
